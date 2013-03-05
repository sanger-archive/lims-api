require 'integrations/spec_helper'

Rspec.configure do |config|
  # Stub uuid to generete a Sequence of uuid 
  # depending on the class
  config.before(:each) do 
    $uuid_sequence = 0
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
