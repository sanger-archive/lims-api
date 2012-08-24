require 'spec_helper'
require 'lims-api/resource_shared'

require 'lims-api/core_resource_page'

module Lims::Api
  shared_context "no models" do
    let(:models) { [] }
  end

  shared_context "with models" do
    let(:models) { 1.upto(45).map { |i| model_class.new(i) } } 
  end

  shared_context "page" do |page_number|
    let(:page_number) { page_number }
  end

  shared_examples_for "page resource" do |response|
    context "unloaded" do
      it do
        expect { subject.actions}.to raise_error(CoreResourcePage::UnloadedError)
      end

      its(:state) { should == "unloaded" }
    end

    context "loaded" do
      before (:each) {
        session = mock(:session)
        session.stub_chain(:persistor_for, :slice) { |first, last| models[first, last] }
        resource.load_objects(session)
      }

      its(:state) { should == "loaded" }
      its(:actions) { should be_a(Array) }

      context "::JSonEncoder" do
        subject { resource.encoder_for(['application/json']) }
        it "return a list of actions" do
          subject.call.should match_json( "models" => response)
        end
      end
    end
  end

  describe CoreResourcePage do
    def self.validate_number_of_pages(object_number, number_per_page, number_of_pages)
      context "#page number (objects = #{object_number}, number per page = #{number_per_page})" do
        let(:context) { mock(:context).tap do |c|
          c.stub(:model_count) { object_number }
        end
        }
        let(:session) { mock(:session).tap do |s|
          s.stub_chain(:persistor_for, :slice) { [] }
        end
        }
        subject{ described_class.new(context, nil, nil, 0, number_per_page) }
        it "computes the correct number of pages" do
          subject.load_objects(session)
          subject.number_of_pages.should== number_of_pages
        end
      end
    end

    validate_number_of_pages 0, 10, 1
    validate_number_of_pages 10, 10, 1
    validate_number_of_pages 11, 10, 2


    def self.validate_index_range(object_number, number_per_page, page_number, first, last)
      context "#page number (objects = #{object_number}, number per page = #{number_per_page}, page = #{page_number})" do
        let(:context) { mock(:context).tap do |c|
          c.stub(:model_count) { object_number }
        end
        }
        let(:session) { mock(:session).tap do |s|
          s.stub_chain(:persistor_for, :slice) { [] }
        end
        }
        subject{ described_class.new(context, nil, nil, page_number, number_per_page) }
        it "computes the correct pages range" do
          subject.load_objects(session)
          subject.first_index.should == first
          subject.last_index.should == last
        end
      end
    end
    validate_index_range 0, 10, 1, 0, 0
    validate_index_range 5, 10, 1, 0, 4
    validate_index_range 45, 10, 2, 10, 19
    validate_index_range 45, 10, 5, 40, 44

    context "within a valid context" do
      let(:store) { mock(:store) }
      let(:server_context) {
        Context.new(store, lambda { |u| "/#{u}" })
      }
      let(:model_class) {
        class Model
          attr_reader :n
          def initialize(i)
            @n = i
          end
        end

      server_context.stub(:resource_class_for) {
        class ModelResource < CoreResource
          def content_to_stream(s)
            s.add_value object.n
          end
        end
      ModelResource

      }
      Model

      }
      let(:model) { "models" }
      let(:number_per_page) { 10 }
      let(:number_of_pages) { 5}
      let(:resource) { described_class.new(server_context, model_class, model, page_number, number_per_page) }
      subject { resource }
      before (:each) { server_context.stub(:model_count).and_return(models.size) }

      context "no underlying models" do
        include_context "no models"
        context "page 1" do
          include_context "page", 1
          it_behaves_like "page resource", {
            "actions" => {
            "read" => "/models/page=1"
            # no previous page
            # no next page
          },
            "models" => [
          ]
          }
        end
      end

      context "with underlying models" do
        include_context "with models"
        context "first page", :focus => true do
          include_context "page", 1
          it_behaves_like "page resource", {
            "actions" => {
            "read" => "/models/page=1",
            # no previous page
            "next" => "/models/page=2"
          },
            "models" => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          }
        end
        context "last page" do
          include_context "page", 5
          it_behaves_like "page resource", {
            "actions" => {
            "read" => "/models/page=5",
            "previous" => "/models/page=4"
            # no next page
          },
            "models" => [41, 42, 43, 44, 45]
          }
        end
      end
    end
  end
end
