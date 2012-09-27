#receptacle_spec.rb
require 'spec_helper'
require 'lims-api/resources/receptacle'
require 'lims-api/struct_stream'
require 'lims-api/resource_shared'

shared_examples_for "a receptacle" do
  it { subject.should respond_to(:receptacle_to_stream) }
  it { 
    stream = Lims::Api::StructStream.new
    subject.receptacle_to_stream(stream,receptacle) 
    stream.struct.should eq([{"sample_uuid"=>sample_uuid}])
  }
end

module Lims::Api::Resources
  describe Receptacle do

    context "an object with receptacle" do
      subject do
        Object.new.tap do |object| 
          class << object
            include Lims::Api::Resources::Receptacle
            include Lims::Api::Resource
          end
        end
      end
      let(:sample_uuid) { "12345" }
      let(:aliquot) { 
        mock(:aliquot).tap do |aliquot|
        aliquot.stub(:attributes) { {"sample_uuid"=> sample_uuid} }
        end
      }
      let(:receptacle) { [aliquot] }
      it_behaves_like "a receptacle"
    end

  end
end
