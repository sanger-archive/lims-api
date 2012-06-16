require 'lims/api/context'

module Lims::Api
  # Create the appropriate context per request and set the appropriate store.
  class ContextService
    # @param [Lims::Core::Persistence::Store] store  
    def initialize(store)
      @store = store
    end

    # Called by the server to create the appropriate context depending of the request.
    # Different context can corresponds to different user level of authorisation
    # or client etc ...
    # @return [Context]
    def new(request)
      Context.new(@store)
    end
  end
end
