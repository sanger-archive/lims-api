require 'spec_helper'

require 'lims-api/struct_stream'

module Lims::Api
describe StructStream do
  context "build"
  it "a hash" do
    subject.start_hash
    subject.add_key "A"
    subject.add_value 1
    subject.end_hash

    subject.struct.should == {"A" => 1 }
  end

  it "an Array" do
    subject.start_array
    subject.add_value 1
    subject.add_value 2
    subject.add_value 3
    subject.end_array

    subject.struct.should == [1, 2, 3]
  end

  it "a complex object" do
    subject.start_hash
    subject.add_key "list"

    subject.start_array
    subject.add_value 1
    subject.add_value 2
    subject.add_value 3

    subject.start_hash
    subject.add_key "A"
    subject.add_value 1
    subject.end_hash

    subject.end_array

    subject.end_hash

    subject.struct.should == { "list" => [1, 2, 3, {"A" => 1} ] }

  end
end
end
