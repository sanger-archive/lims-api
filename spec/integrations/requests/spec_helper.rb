require 'integrations/spec_helper'

def set_uuid_start(*ids)
  $uuid_sequence = ids.inject(0) do |m,id|
    m = m*10 + id 
  end
end

def expand_uuid(ids)
  return ids if ids.is_a?(String)
  Lims::Core::Uuids::UuidResource::Form.zip(ids).map { |length, id| id.to_s*length }.join('-')
end

Rspec.configure do |config|
  # Stub uuid to generete a Sequence of uuid 
  # depending on the class
  config.before(:each) do 
    Lims::Core::Uuids::UuidResource.stub(:generate_uuid) do
      sequence = $uuid_sequence
      $uuid_sequence +=1
      ids = []
      Lims::Core::Uuids::UuidResource::Form.each do 
        ids.unshift(sequence % 10)
        sequence = sequence / 10
      end
      expand_uuid(ids)
    end

    set_uuid_start(1,2,3,4,0)
  end
end

def save_with_uuid(args)
  store.with_session do |session|
    args.each do |object, uuid|
      set_uuid(session, object, expand_uuid(uuid))
    end
  end
end
