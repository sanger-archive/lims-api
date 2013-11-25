require 'lims-api/context'

module Lims::Api
  # Create the appropriate context per request and set the appropriate store.
  class ContextService
    attr_accessor :strict # decide if connection parameters (user, application) should be set or not.
    # @param [Lims::Core::Persistence::Store] store  
    # @param [Lims::Core::Persistence::MessageBus] message bus
    # @param [String,Nil] application_id
    def initialize(store, message_bus, application_id=nil)
      @store = store
      @message_bus = message_bus
      @message_bus.backend_application_id ||= application_id if application_id
      @message_bus.connect
      @application_id = application_id
      @strict = false;
    end

    # Called by the server to create the appropriate context depending of the request.
    # Different context can corresponds to different user level of authorisation
    # or client etc ...
    # @return [Context, String] error string if problem
    def new(request, url_generator)
      user, application_id = nil, nil
      session = @store.with_session do |session|
        user = get_user(request, session)
        application_id = get_application_id(request)

        if strict
          return "User or Application_id missing" unless user && application_id
        else
          user ||= "user"
          application_id ||= "application"
        end
        session
      end

      Context.new(@store, @message_bus, application_id, user, url_generator, request.content_type).tap do |context|

        context.instance_eval do
          @last_session = session
        end
      end

    end

    # Extract the context from the request parameters
    # Can be overriden by the application to return  User object.
    # User can be anything but need to have to_s implemented.
    # Default implementation extract the user email form the HTTP Header
    # @param [Rack::Request] request 
    # @return [Object]
    def get_user(request, session)
      request.env['HTTP_USER_EMAIL']
    end  

    def get_application_id(request)
      request.env['HTTP_APPLICATION_ID']
    end
  end
end
