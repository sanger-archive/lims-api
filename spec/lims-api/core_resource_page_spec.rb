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
          subject.call.should match_json(response)
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
      let(:message_bus) { mock(:message_bus) }
      let(:application_id) { mock(:application_id) }
      let(:server_context) {
        Context.new(store, message_bus, application_id, lambda { |u| "/#{u}" }, '')
      }
      let(:model_class) {
        class Model
          attr_reader :n
          def initialize(i)
            @n = i
          end
          def uuid
          '11111111-2222-3333-4444-%0.12d' % @n
          end
        end

      server_context.stub(:resource_class_for) {
        class ModelResource < Lims::Api::CoreResource
          def content_to_stream(s, mime_type)
            s.add_key "n"
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
      before (:each) {
        server_context.stub(:model_count).and_return(models.size)
        server_context.stub(:uuid_for) { |object| object.uuid}
        server_context.stub(:find_model_name) { "model" }
      }

      context "no underlying models" do
        include_context "no models"
        context "page 1" do
          include_context "page", 1
          it_behaves_like "page resource", {
            "actions" => {
              "read" => "/models/page=1",
              "first"=> "/models/page=1",
              # no previous page
              # no next page
              "last" => "/models/page=-1"
          },
            "models" => [
          ],
            "size" => 0
          }
        end
      end

      context "with underlying models" do
        include_context "with models"
        context "first page", :focus  => true   do
          include_context "page", 1
          it_behaves_like "page resource", {
            "actions" => {
            "read" => "/models/page=1",
            "first"=>"/models/page=1",
            # no previous page
            "next" => "/models/page=2",
            "last"=> "/models/page=-1"
          },
            "models" => [{"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000001","update"=>"/11111111-2222-3333-4444-000000000001","delete"=>"/11111111-2222-3333-4444-000000000001","create"=>"/11111111-2222-3333-4444-000000000001"}, "uuid"=>"11111111-2222-3333-4444-000000000001", "n"=>1},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000002","update"=>"/11111111-2222-3333-4444-000000000002","delete"=>"/11111111-2222-3333-4444-000000000002","create"=>"/11111111-2222-3333-4444-000000000002"}, "uuid"=>"11111111-2222-3333-4444-000000000002", "n"=>2},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000003","update"=>"/11111111-2222-3333-4444-000000000003","delete"=>"/11111111-2222-3333-4444-000000000003","create"=>"/11111111-2222-3333-4444-000000000003"}, "uuid"=>"11111111-2222-3333-4444-000000000003", "n"=>3},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000004","update"=>"/11111111-2222-3333-4444-000000000004","delete"=>"/11111111-2222-3333-4444-000000000004","create"=>"/11111111-2222-3333-4444-000000000004"}, "uuid"=>"11111111-2222-3333-4444-000000000004", "n"=>4},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000005","update"=>"/11111111-2222-3333-4444-000000000005","delete"=>"/11111111-2222-3333-4444-000000000005","create"=>"/11111111-2222-3333-4444-000000000005"}, "uuid"=>"11111111-2222-3333-4444-000000000005", "n"=>5},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000006","update"=>"/11111111-2222-3333-4444-000000000006","delete"=>"/11111111-2222-3333-4444-000000000006","create"=>"/11111111-2222-3333-4444-000000000006"}, "uuid"=>"11111111-2222-3333-4444-000000000006", "n"=>6},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000007","update"=>"/11111111-2222-3333-4444-000000000007","delete"=>"/11111111-2222-3333-4444-000000000007","create"=>"/11111111-2222-3333-4444-000000000007"}, "uuid"=>"11111111-2222-3333-4444-000000000007", "n"=>7},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000008","update"=>"/11111111-2222-3333-4444-000000000008","delete"=>"/11111111-2222-3333-4444-000000000008","create"=>"/11111111-2222-3333-4444-000000000008"}, "uuid"=>"11111111-2222-3333-4444-000000000008", "n"=>8},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000009","update"=>"/11111111-2222-3333-4444-000000000009","delete"=>"/11111111-2222-3333-4444-000000000009","create"=>"/11111111-2222-3333-4444-000000000009"}, "uuid"=>"11111111-2222-3333-4444-000000000009", "n"=>9},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000010","update"=>"/11111111-2222-3333-4444-000000000010","delete"=>"/11111111-2222-3333-4444-000000000010","create"=>"/11111111-2222-3333-4444-000000000010"}, "uuid"=>"11111111-2222-3333-4444-000000000010", "n"=>10}],
            "size" => 45
          }
            
        end
        
        shared_examples_for "last page resource" do
          it_behaves_like "page resource", {
            "actions" => {
            "read" => "/models/page=5",
            "first" => "/models/page=1",
            "previous" => "/models/page=4",
            # no next page
            "last" => "/models/page=-1"
            },
            "models" => [{"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000041","update"=>"/11111111-2222-3333-4444-000000000041","delete"=>"/11111111-2222-3333-4444-000000000041","create"=>"/11111111-2222-3333-4444-000000000041"}, "uuid"=>"11111111-2222-3333-4444-000000000041", "n"=>41},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000042","update"=>"/11111111-2222-3333-4444-000000000042","delete"=>"/11111111-2222-3333-4444-000000000042","create"=>"/11111111-2222-3333-4444-000000000042"}, "uuid"=>"11111111-2222-3333-4444-000000000042", "n"=>42},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000043","update"=>"/11111111-2222-3333-4444-000000000043","delete"=>"/11111111-2222-3333-4444-000000000043","create"=>"/11111111-2222-3333-4444-000000000043"}, "uuid"=>"11111111-2222-3333-4444-000000000043", "n"=>43},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000044","update"=>"/11111111-2222-3333-4444-000000000044","delete"=>"/11111111-2222-3333-4444-000000000044","create"=>"/11111111-2222-3333-4444-000000000044"}, "uuid"=>"11111111-2222-3333-4444-000000000044", "n"=>44},
               {"actions"=>{"read"=>"/11111111-2222-3333-4444-000000000045","update"=>"/11111111-2222-3333-4444-000000000045","delete"=>"/11111111-2222-3333-4444-000000000045","create"=>"/11111111-2222-3333-4444-000000000045"}, "uuid"=>"11111111-2222-3333-4444-000000000045", "n"=>45}],
            "size" => 45
          }
        end
        
        context "last page" do
          include_context "page", 5
          it_behaves_like "last page resource"
        end
        
        context "last page with alias (-1)" do
          include_context "page", -1
          it_behaves_like "last page resource"
        end

      end
    end
  end
end
