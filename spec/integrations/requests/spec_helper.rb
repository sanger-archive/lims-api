require 'integrations/spec_helper'
require 'lims-api/laboratory/all'
require 'lims-api/labels/all'
require 'lims-api/organization/all'
require 'lims-core/persistence/search/all'
require 'lims-api/persistence/search_resource'

def set_uuid_start(*ids)
  $uuid_sequence = ids.inject(0) do |m,id|
    m = m*10 + id 
  end
end

def push_uuids(uuids)
  $uuids_sequence ||= []
  $uuids_sequence.concat(uuids.is_a?(Array) ? uuids : [uuids])
end

def expand_uuid(ids)
  return ids if ids.is_a?(String)
  Lims::Core::Persistence::UuidResource::Form.zip(ids).map { |length, id| id.to_s*length }.join('-')
end

Rspec.configure do |config|
  # Stub uuid to generete a Sequence of uuid 
  # depending on the class
  config.before(:each) do 
    Lims::Core::Persistence::UuidResource.stub(:generate_uuid) do
      if $uuids_sequence.is_a?(Array) && $uuids_sequence.size > 0
        expand_uuid($uuids_sequence.shift)
      else
        sequence = $uuid_sequence
        $uuid_sequence +=1
        ids = []
        Lims::Core::Persistence::UuidResource::Form.each do 
          ids.unshift(sequence % 10)
          sequence = sequence / 10
        end
        expand_uuid(ids)
      end
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
