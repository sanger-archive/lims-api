require 'lims-api/context'

def create_element_hash
  {}.tap do |h|
    (1..number_of_rows).each do |r|
      (1..number_of_columns).each do |c|
        h["#{(?A.ord+r-1).chr}#{c}"]=[]
      end
    end
  end
end

shared_context "mock context" do
  let!(:server_context) {
    #Context.new(store, lambda { |url| "/#{url}"  }).tap do |context|
    mock(:context).tap do |context|
      context.stub(:url_for)  { |url| "/#{url}"  }
      context.stub(:recursively_lookup_uuid) { |a| a }
      context.stub(:last_session) { |s| s }
    end
  }
end

shared_context "with filled aliquots" do
  let(:aliquot_array) {
    path = "http://example.org/#{sample_uuid}"
      [ { "sample"=> {"actions" => { "read" => path,
        "update" => path,
        "delete" => path,
        "create" => path },
        "uuid" => sample_uuid,
        "name" => sample_name},
        "type" => aliquot_type,
        "quantity" => aliquot_quantity,
        "unit" => unit_type
  } ]
  }
end

shared_context "aliquots with solvent" do
  let(:aliquot_array_source) {
    path = "http://example.org/#{sample_uuid}"
      [
        { "sample"=> {"actions" => { "read" => path,
          "create" => path,
          "update" => path,
          "delete" => path },
        "uuid" => sample_uuid,
        "name" => sample_name},
        "quantity" => 0,
        "type" => aliquot_type,
        "unit" => unit_type
        },
        solvent
      ]
  }

  let(:aliquot_array_source_with_fraction) {
    path = "http://example.org/#{sample_uuid}"
      [
        { "sample"=> {"actions" => { "read" => path,
          "create" => path,
          "update" => path,
          "delete" => path },
        "uuid" => sample_uuid,
        "name" => sample_name},
        "quantity" => 0.0,
        "type" => aliquot_type,
        "unit" => unit_type
        },
        solvent_with_fraction
      ]
  }

  let(:aliquot_array_target) {
    path = "http://example.org/#{sample_uuid}"
      [
        { "sample"=> {"actions" => { "read" => path,
          "create" => path,
          "update" => path,
          "delete" => path },
        "uuid" => sample_uuid,
        "name" => sample_name},
        "quantity" => 100,
        "type" => "RNA",
        "unit" => unit_type
        },
        modified_solvent
      ]
  }

  let(:aliquot_array_target_DNA) {
    path = "http://example.org/#{sample_uuid}"
      [
        { "sample"=> {"actions" => { "read" => path,
          "create" => path,
          "update" => path,
          "delete" => path },
        "uuid" => sample_uuid,
        "name" => sample_name},
        "quantity" => 50.0,
        "type" => "DNA",
        "unit" => unit_type
        },
        modified_solvent_DNA
      ]
  }

  let(:aliquot_array_target_RNA) {
    path = "http://example.org/#{sample_uuid}"
      [
        { "sample"=> {"actions" => { "read" => path,
          "create" => path,
          "update" => path,
          "delete" => path },
        "uuid" => sample_uuid,
        "name" => sample_name},
        "quantity" => 50.0,
        "type" => "RNA",
        "unit" => unit_type
        },
        modified_solvent_RNA
      ]
  }

  let(:solvent) { {"quantity" => 0, "type" => "solvent", "unit" => "ul"} }
  let(:solvent_with_fraction) { {"quantity" => 0, "type" => "solvent", "unit" => "ul"} }

  # currently we also change the water to the given aliquot type
  # this is not correct, we should fix it later
  let(:modified_solvent) { {"quantity"=>100, "type"=>"RNA", "unit"=>"mole"} }
  let(:modified_solvent_DNA) { {"quantity"=>50.0, "type"=>"DNA", "unit"=>"mole"} }
  let(:modified_solvent_RNA) { {"quantity"=>50.0, "type"=>"RNA", "unit"=>"mole"} }
end


shared_context "resource with labels for the expected JSON" do
  let!(:label_position_front) { "front_label" }
  let(:front_label_type) { "sanger-barcode" }
  let(:front_label_value) { "ABCD-1234" }
  let(:labels_hash) {
    { label_position_front => { "type" => front_label_type,
                                "value" => front_label_value}
    }
  }
end
