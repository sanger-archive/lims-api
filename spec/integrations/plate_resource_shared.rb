shared_context "for creating a plate-like with aliquots and solvent in it" do
  L = Lims::Core::Laboratory
  def create_plate_like_with_aliquots_and_solvent(asset, uuid, sample, location, quantity=100, volume=100)
    store.with_session do |session|
      new_asset = asset.new(:number_of_rows => number_of_rows,
                           :number_of_columns => number_of_columns)
#      locations.zip(samples) do |location, sample|
        aliquot = L::Aliquot.new(:sample => sample, :quantity => quantity, :type => aliquot_type)
        if asset == L::TubeRack
          tube = L::Tube.new
          tube << aliquot
          tube << L::Aliquot.new(:type => L::Aliquot::Solvent, :quantity => volume)
          new_asset[location] = tube
        else
          new_asset[location] << aliquot
          new_asset[location] << L::Aliquot.new(:type => L::Aliquot::Solvent, :quantity => volume)
        end
#      end

      session << new_asset
      set_uuid(session, new_asset, uuid)
    end
    uuid
  end

  def create_samples(sample_data)
    samples = []
    sample_data.map do |data|
      data.mash do |uuid, name|
        uuid.tap do |sample_uuid|
          store.with_session do |session|
            sample = L::Sample.new(:name => name)
            session << sample
            set_uuid(session, sample, sample_uuid)
            samples << sample
          end
        end
      end
    end
    samples
  end

  def create_plate_with_aliquots_and_solvent(uuid, sample, location, quantity=100, volume=100)
    create_plate_like_with_aliquots_and_solvent(L::Plate, uuid, sample, location, quantity, volume)
  end

  def create_gel_with_aliquots_and_solvent(uuid, sample, location, quantity=100, volume=100)
    create_plate_like_with_aliquots_and_solvent(L::Gel, uuid, sample, location, quantity, volume)
  end

  def create_tube_rack_with_aliquots_and_solvent(uuid, sample, location, quantity=100, volume=100)
    create_plate_like_with_aliquots_and_solvent(L::TubeRack, uuid, sample, location, quantity, volume)
  end

  def new_empty_plate_like(asset_to_create, uuid)
    store.with_session do |session|
      new_asset = asset_to_create.new(:number_of_rows => number_of_rows, :number_of_columns => number_of_columns)
      set_uuid(session, new_asset, uuid)
    end
    uuid
  end

  def new_empty_plate(uuid)
    new_empty_plate_like(L::Plate, uuid)
  end

  def new_empty_gel(uuid)
    new_empty_plate_like(L::Gel, uuid)
  end

  def new_empty_tube_rack(uuid)
    new_empty_plate_like(L::TubeRack, uuid)
  end
end

shared_context "has dimensions" do |number_of_rows, number_of_columns|
  let(:number_of_rows) { number_of_rows }
  let(:number_of_columns) { number_of_columns }
  let(:dimensions) { {:number_of_rows => number_of_rows, :number_of_columns => number_of_columns} }
end

shared_context "has standard dimensions" do
  include_context("has dimensions", 8, 12)
end

shared_context "with source elements" do
  let(:source_solvent) { {"quantity"=>60.0, "type"=>"solvent", "unit"=>"ul"} }
  let(:source_aliquot_array1) {
    path = "http://example.org/#{sample_uuid}"
    [ { "sample"=> {"actions" => { "read" => path,
                                   "create" => path,
                                   "update" => path,
                                   "delete" => path },
                                   "uuid" => sample_uuid,
                                   "name" => sample1_name},
                                   "quantity" => source_aliquot_quantity,
                                   "type" => aliquot_type,
                                   "unit" => unit_type},
                                   source_solvent ]
  }
  let(:source_aliquot_array2) {
    path = "http://example.org/#{sample_uuid}"
    [ { "sample"=> {"actions" => { "read" => path,
                                   "create" => path,
                                   "update" => path,
                                   "delete" => path },
                                   "uuid" => sample_uuid,
                                   "name" => sample2_name},
                                   "quantity" => source_aliquot_quantity,
                                   "type" => aliquot_type,
                                   "unit" => unit_type},
                                   source_solvent ]
  }
  let(:source_elements1) { {
    "A1"=>source_aliquot_array1,"A2"=>[],"A3"=>[],"A4"=>[],"A5"=>[],"A6"=>[],"A7"=>[],"A8"=>[],"A9"=>[],"A10"=>[],"A11"=>[],"A12"=>[],
    "B1"=>[],"B2"=>[],"B3"=>[],"B4"=>[],"B5"=>[],"B6"=>[],"B7"=>[],"B8"=>[],"B9"=>[],"B10"=>[],"B11"=>[],"B12"=>[],
    "C1"=>[],"C2"=>[],"C3"=>[],"C4"=>[],"C5"=>[],"C6"=>[],"C7"=>[],"C8"=>[],"C9"=>[],"C10"=>[],"C11"=>[],"C12"=>[],
    "D1"=>[],"D2"=>[],"D3"=>[],"D4"=>[],"D5"=>[],"D6"=>[],"D7"=>[],"D8"=>[],"D9"=>[],"D10"=>[],"D11"=>[],"D12"=>[],
    "E1"=>[],"E2"=>[],"E3"=>[],"E4"=>[],"E5"=>[],"E6"=>[],"E7"=>[],"E8"=>[],"E9"=>[],"E10"=>[],"E11"=>[],"E12"=>[],
    "F1"=>[],"F2"=>[],"F3"=>[],"F4"=>[],"F5"=>[],"F6"=>[],"F7"=>[],"F8"=>[],"F9"=>[],"F10"=>[],"F11"=>[],"F12"=>[],
    "G1"=>[],"G2"=>[],"G3"=>[],"G4"=>[],"G5"=>[],"G6"=>[],"G7"=>[],"G8"=>[],"G9"=>[],"G10"=>[],"G11"=>[],"G12"=>[],
    "H1"=>[],"H2"=>[],"H3"=>[],"H4"=>[],"H5"=>[],"H6"=>[],"H7"=>[],"H8"=>[],"H9"=>[],"H10"=>[],"H11"=>[],"H12"=>[]}
  }
  let(:source_elements2) { {
    "A1"=>[],"A2"=>[],"A3"=>[],"A4"=>[],"A5"=>[],"A6"=>[],"A7"=>[],"A8"=>[],"A9"=>[],"A10"=>[],"A11"=>[],"A12"=>[],
    "B1"=>[],"B2"=>[],"B3"=>[],"B4"=>[],"B5"=>[],"B6"=>[],"B7"=>[],"B8"=>[],"B9"=>[],"B10"=>[],"B11"=>[],"B12"=>[],
    "C1"=>[],"C2"=>[],"C3"=>source_aliquot_array2,"C4"=>[],"C5"=>[],"C6"=>[],"C7"=>[],"C8"=>[],"C9"=>[],"C10"=>[],"C11"=>[],"C12"=>[],
    "D1"=>[],"D2"=>[],"D3"=>[],"D4"=>[],"D5"=>[],"D6"=>[],"D7"=>[],"D8"=>[],"D9"=>[],"D10"=>[],"D11"=>[],"D12"=>[],
    "E1"=>[],"E2"=>[],"E3"=>[],"E4"=>[],"E5"=>[],"E6"=>[],"E7"=>[],"E8"=>[],"E9"=>[],"E10"=>[],"E11"=>[],"E12"=>[],
    "F1"=>[],"F2"=>[],"F3"=>[],"F4"=>[],"F5"=>[],"F6"=>[],"F7"=>[],"F8"=>[],"F9"=>[],"F10"=>[],"F11"=>[],"F12"=>[],
    "G1"=>[],"G2"=>[],"G3"=>[],"G4"=>[],"G5"=>[],"G6"=>[],"G7"=>[],"G8"=>[],"G9"=>[],"G10"=>[],"G11"=>[],"G12"=>[],
    "H1"=>[],"H2"=>[],"H3"=>[],"H4"=>[],"H5"=>[],"H6"=>[],"H7"=>[],"H8"=>[],"H9"=>[],"H10"=>[],"H11"=>[],"H12"=>[]}
  }
  let(:tube_rack_source_elements1) {
    path = "http://example.org/#{sample_uuid}"
    {"A1"=>{"actions"=>{"read"=>path,
                        "create"=>path,
                        "update"=>path,
                        "delete"=>path},
            "uuid"=>sample_uuid,
            "type"=>nil,
            "max_volume"=>nil,
            "aliquots"=>source_aliquot_array1}
    }
  }
  let(:tube_rack_source_elements2) {
    path = "http://example.org/#{sample_uuid}"
    {"C3"=>{"actions"=>{"read"=>path,
                        "create"=>path,
                        "update"=>path,
                        "delete"=>path},
            "uuid"=>sample_uuid,
            "type"=>nil,
            "max_volume"=>nil,
            "aliquots"=>source_aliquot_array2}
    }
  }
end

shared_context "with target elements" do
  let(:target_solvent_DNA) { {"quantity"=>40.0, "type"=>"DNA", "unit"=>"mole"} }
  let(:target_solvent_RNA) { {"quantity"=>40.0, "type"=>"RNA", "unit"=>"mole"} }
  let(:target_aliquot_array1) {
    path = "http://example.org/#{sample_uuid}"
    [ { "sample"=> {"actions" => { "read" => path,
                                   "create" => path,
                                   "update" => path,
                                   "delete" => path },
                                   "uuid" => sample_uuid,
                                   "name" => sample1_name},
                                   "quantity" => target_aliquot_quantity1,
                                   "type" => target_aliquot_type1,
                                   "unit" => unit_type},
                                   target_solvent_DNA ]
  }
  let(:target_aliquot_array2) {
    path = "http://example.org/#{sample_uuid}"
    [ { "sample"=> {"actions" => { "read" => path,
                                   "create" => path,
                                   "update" => path,
                                   "delete" => path },
                                   "uuid" => sample_uuid,
                                   "name" => sample2_name},
                                   "type" => target_aliquot_type2,
                                   "quantity" => target_aliquot_quantity2,
                                   "type" => target_aliquot_type2,
                                   "unit" => unit_type},
                                   target_solvent_RNA ]
  }
  let(:target_elements1) { {
    "A1"=>[],"A2"=>[],"A3"=>[],"A4"=>[],"A5"=>[],"A6"=>[],"A7"=>[],"A8"=>[],"A9"=>[],"A10"=>[],"A11"=>[],"A12"=>[],
    "B1"=>[],"B2"=>target_aliquot_array1,"B3"=>[],"B4"=>[],"B5"=>[],"B6"=>[],"B7"=>[],"B8"=>[],"B9"=>[],"B10"=>[],"B11"=>[],"B12"=>[],
    "C1"=>[],"C2"=>[],"C3"=>[],"C4"=>[],"C5"=>[],"C6"=>[],"C7"=>[],"C8"=>[],"C9"=>[],"C10"=>[],"C11"=>[],"C12"=>[],
    "D1"=>[],"D2"=>[],"D3"=>[],"D4"=>[],"D5"=>[],"D6"=>[],"D7"=>[],"D8"=>[],"D9"=>[],"D10"=>[],"D11"=>[],"D12"=>[],
    "E1"=>[],"E2"=>[],"E3"=>[],"E4"=>[],"E5"=>[],"E6"=>[],"E7"=>[],"E8"=>[],"E9"=>[],"E10"=>[],"E11"=>[],"E12"=>[],
    "F1"=>[],"F2"=>[],"F3"=>[],"F4"=>[],"F5"=>[],"F6"=>[],"F7"=>[],"F8"=>[],"F9"=>[],"F10"=>[],"F11"=>[],"F12"=>[],
    "G1"=>[],"G2"=>[],"G3"=>[],"G4"=>[],"G5"=>[],"G6"=>[],"G7"=>[],"G8"=>[],"G9"=>[],"G10"=>[],"G11"=>[],"G12"=>[],
    "H1"=>[],"H2"=>[],"H3"=>[],"H4"=>[],"H5"=>[],"H6"=>[],"H7"=>[],"H8"=>[],"H9"=>[],"H10"=>[],"H11"=>[],"H12"=>[]}
  }
  let(:target_elements2) { {
    "A1"=>[],"A2"=>[],"A3"=>[],"A4"=>[],"A5"=>[],"A6"=>[],"A7"=>[],"A8"=>[],"A9"=>[],"A10"=>[],"A11"=>[],"A12"=>[],
    "B1"=>[],"B2"=>[],"B3"=>[],"B4"=>[],"B5"=>[],"B6"=>[],"B7"=>[],"B8"=>[],"B9"=>[],"B10"=>[],"B11"=>[],"B12"=>[],
    "C1"=>[],"C2"=>[],"C3"=>[],"C4"=>[],"C5"=>[],"C6"=>[],"C7"=>[],"C8"=>[],"C9"=>[],"C10"=>[],"C11"=>[],"C12"=>[],
    "D1"=>[],"D2"=>[],"D3"=>[],"D4"=>target_aliquot_array2,"D5"=>[],"D6"=>[],"D7"=>[],"D8"=>[],"D9"=>[],"D10"=>[],"D11"=>[],"D12"=>[],
    "E1"=>[],"E2"=>[],"E3"=>[],"E4"=>[],"E5"=>[],"E6"=>[],"E7"=>[],"E8"=>[],"E9"=>[],"E10"=>[],"E11"=>[],"E12"=>[],
    "F1"=>[],"F2"=>[],"F3"=>[],"F4"=>[],"F5"=>[],"F6"=>[],"F7"=>[],"F8"=>[],"F9"=>[],"F10"=>[],"F11"=>[],"F12"=>[],
    "G1"=>[],"G2"=>[],"G3"=>[],"G4"=>[],"G5"=>[],"G6"=>[],"G7"=>[],"G8"=>[],"G9"=>[],"G10"=>[],"G11"=>[],"G12"=>[],
    "H1"=>[],"H2"=>[],"H3"=>[],"H4"=>[],"H5"=>[],"H6"=>[],"H7"=>[],"H8"=>[],"H9"=>[],"H10"=>[],"H11"=>[],"H12"=>[]}
  }
  let(:tube_rack_target_elements1) {
    path = "http://example.org/#{sample_uuid}"
    {"B2"=>{"actions"=>{"read"=>path,
                        "create"=>path,
                        "update"=>path,
                        "delete"=>path},
            "uuid"=>sample_uuid
            "type"=>nil,
            "max_volume"=>nil,
            "aliquots"=>target_aliquot_array1}
    }
  }
  let(:tube_rack_target_elements2) {
    path = "http://example.org/#{sample_uuid}"
    {"D4"=>{"actions"=>{"read"=>path,
                        "create"=>path,
                        "update"=>path,
                        "delete"=>path},
            "uuid"=>sample_uuid,
            "type"=>nil,
            "max_volume"=>nil,
            "aliquots"=>target_aliquot_array2}
    }
  }
end
