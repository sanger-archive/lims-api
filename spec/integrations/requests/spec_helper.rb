require 'integrations/spec_helper'

def set_uuid_start(*ids)
  $uuid_sequence = ids.inject(0) do |m,id|
    m = m*10 + id 
  end
end

Rspec.configure do |config|
  # Stub uuid to generete a Sequence of uuid 
  # depending on the class
  config.before(:each) do 
    Lims::Core::Uuids::UuidResource.stub(:generate_uuid) do
      sequence = $uuid_sequence
      $uuid_sequence +=1
      ids = []
      Lims::Core::Uuids::UuidResource::Form.reverse.map do |length|
        id = sequence % 10
        sequence /= 10
        id.to_s*length
      end.reverse.join('-')
    end

    set_uuid_start(1,2,3,4,0)
  end
end
