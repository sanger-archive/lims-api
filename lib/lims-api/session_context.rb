require 'lims-api/context'

module Lims
  module Api
    # Context related to a specific session (or UserSession) :
    # It allows to access a particular state of a resource in the past (a particular session),
    # as well as all its related resources.
    class SessionContext < Context
      attr_reader :session_id
      attr_reader :master_session
      def initialize(session_id, *args, &block)
        @session_id = session_id
        super(*args, &block)
      end

      # Set the session already created by the ContextService.
      # For this context, we create a special 'in past' session
      # corresponding to the session_id
      def set_initial_session(session)
        @master_session = session
        @user_session = session.user_session[session_id]
        @user_session.with_session do |revision_session|
          super(revision_session)
        end
      end
      def for_uuid(uuid)
        with_session do |session|
          session.uuid_resource[:uuid => uuid]
        end.andtap do |uuid_resource|
              CoreRevisionResource.new(self, uuid_resource, find_model_name(uuid_resource.model_class))
          end
      end

      # Add 
      def url_for(path)
        url = super(path)
        # Add the session id if needed
        case url
        when /session/ then url
        else "#{url}/sessions/#{@session_id}"
        end
      end
    end
  end
end
