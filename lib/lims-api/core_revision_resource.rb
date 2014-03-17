require 'lims-api/core_resource'

module Lims::Api
  # A CoreRevision is a proxy to an instnace of Core::Revision, i.e.
  # the state of a resource at a particular time.
  class CoreRevisionResource < CoreResource
    def initialize(context, uuid_resource, model_name, session_id, object=nil)
      @session_id = session_id
      super(context, uuid_resource, model_name, object)
    end
    # List of actions available
    # The revision is readonly but have a next and previous one  [Not Implemented]
    # (if available)
    def actions
      %w[read] # Not implemented yet next previous]
    end

    # display underlying resource
    def content_to_stream(s, mime_type)
      s.add_key "action"
      s.add_value @object.action
      @object.resource.andtap do |resource|
        s.add_key "resource"
        resource_to_stream(s, "resource", @object.resource, mime_type)
      end
    end

    # add session 
    def children_to_stream(s, mime_type)
      debugger
      s.add_key "session"
      resource_to_stream(s, "session", @user_session, mime_type)
    end

    # Load a revision instead of the object itself
    def object(master_session=nil)
      @object ||=  \
        begin
                    raise RuntimeError, "Can't load object without a session" unless master_session
                    @user_session = master_session.user_session[@session_id]
                    @user_session.with_session do |session|
                      state = @uuid_resource.state.new_for_session(session)
                      state.persistor[state.id] # load
                      state.revision.tap do |found|
                      raise RuntimeError, "No object found for #{@uuid_resource.uuid}" unless found
                    end
                  end
        end
    end
  end
end
