require 'lims-api/context'

module Lims::Api
  # Create the appropriate context per request and set the appropriate store.
  class ContextService
    # @param [Lims::Core::Persistence::Store] store  
    # @param [Lims::Core::Persistence::MessageBus] message bus
    # @param [String,Nil] application_id
    def initialize(store, message_bus, application_id=nil)
      @store = store
      @message_bus = message_bus
      @application_id = application_id
    end

    # Called by the server to create the appropriate context depending of the request.
    # Different context can corresponds to different user level of authorisation
    # or client etc ...
    # @return [Context]
    def new(request, url_generator)
      request_data = get_request_data(request)
      Context.new(@store, @message_bus, request_data[:application_id], url_generator,
        request.content_type, request_data[:user])
    end

    # Extract request data information like (user and application/pipeline_id)
    def get_request_data(request)
      user = "user"
      application_id = "application"

      if request["rack.request.query_hash"]
        user = request["rack.request.query_hash"]["user"] || "user"
        application_id = request["rack.request.query_hash"]["application"] || "application"
      end

      { :user => user, :application_id => application_id }
    end
    private :get_request_data

  end
end
