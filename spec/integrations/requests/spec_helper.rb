require 'integrations/spec_helper'

def set_uuid_start(*ids)
  $uuid_sequence = ids.inject(0) do |m,id|
    m = m*10 +  (id-1) 
  end
end

Rspec.configure do |config|
  # Stub uuid to generete a Sequence of uuid 
  # depending on the class
  config.before(:each) do 
    set_uuid_start(1,2,3,4,0)
    Lims::Core::Uuids::UuidResource.stub(:generate_uuid) do
      sequence = $uuid_sequence
      $uuid_sequence +=1
      ids = []
      5.times do 
        ids.unshift (sequence % 10)+1
        sequence /= 10
      end

      Lims::Core::Uuids::UuidResource::Form.zip(ids).map { |length, id| id.to_s*length }.join('-')
    end
  end
end
