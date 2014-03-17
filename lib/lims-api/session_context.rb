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
        super(*args, block)
      end

      # Set the session already created by the ContextService.
      # For this context, we create a special 'in past' session
      # corresponding to the session_id
      def set_initial_session(session)
        @master_session = session
        used_session.user_session[session_id].with_session do |revision_session|
          super(revision_session)
        end
      end
    end
  end
end
