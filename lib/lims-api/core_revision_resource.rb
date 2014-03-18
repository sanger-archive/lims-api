require 'lims-api/core_resource'

module Lims::Api
  # A CoreRevision is a proxy to an instnace of Core::Revision, i.e.
  # the state of a resource at a particular time.
  class CoreRevisionResource < CoreResource
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
        resource_to_stream(s, "resource", @object.resource, mime_type, false)
      end
    end

    # add session 
    def children_to_stream(s, mime_type)
      if @context.user_session
        s.add_key "session"
        resource_to_stream(s, "session", @context.user_session, mime_type)
      end
    end

    # Load a revision instead of the object itself
    def object(session=nil)
      @object ||=  \
        begin
          super(session)
          @uuid_resource.state.revision
        end
    end
  end
end
