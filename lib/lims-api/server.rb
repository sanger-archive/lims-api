require 'sinatra'
require 'rubygems'

# This is the standard HTTP server for the LIMS API, providing a RESTful interface to the
# underlying core data.
module Lims
  module Api
    class Server < Sinatra::Base
      # Irrespective of the environment, we always want our exceptions handled internally, and
      # not by Sinatra itself, nor do we want them to escape the server.
      set(:raise_errors, false)
      set(:show_exceptions, false)

      # @method request_method(*types)
      # @scope class
      #
      # Condition for filters that checks the HTTP request method.
      set(:request_method) do |*types|
        condition { types.include?(request.request_method) }
      end

      # @method status(*codes)
      # @scope class
      #
      # Condition for filters that checks the HTTP response status code.
      set(:status) do |*codes|
        condition { codes.include?(response.status) }
      end

      # @method resource(resource_state)
      # @scope class
      #
      # Condition for filters that checks whether the resource is in the specified state.
      #
      # @param resource_state [true] checks if the resource has been set
      # @param resource_state [false] checks if the resource has not been set
      set(:resource) do |resource_state|
        condition { @resource.nil? != resource_state }
      end

      # Helper method for generating a general error response.  The current request will be halted
      # with the response having a MIME type of `application/json` and the body containing the
      # messages.
      #
      # @param status_code the HTTP status code for the error response
      # @param messages an array of error messages
      def general_error(status_code, *messages)
        halt(status_code, { 'Content-Type' => 'application/json' }, %Q{{"general":#{messages.inspect}}})
      end

      # @method before_all
      # @overload GET '/*'
      # @overload POST '/*'
      # @overload PUT '/*'
      # @overload PATCH '/*'
      # @overload DELETE '/*'
      #
      # Before all requests pick out the details required for a context from the HTTP headers.
      #
      # The server expects the environmental settings to have `context_service` object that
      # responds to the `new` method, taking the HTTP request and returning a context object
      # that can be used for any actions that may be created.
      before do
        @context = settings.context_service.new(request, lambda { |u| self.url(u, true) })
      end

      # @method before_uuid
      # @overload GET '/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
      # @overload POST '/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
      # @overload PUT '/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
      # @overload PATCH '/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
      # @overload DELETE '/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
      #
      # Before handling any request for a UUID, the identifier is mapped to an underlying resource.
      #
      # The current context is expected to respond to the `for_uuid` method, taking the UUID
      # from the URI and returning the underlying resource.  Should the underlying resource be
      # `nil` then the response is an HTTP 404 (Not Found) containing a general error response
      # body.
      before(%r{^/([0-9a-f]{8}(?:-[0-9a-f]{4}){3}-[0-9a-f]{12})(?:/.+)?}) do
        @resource = @context.for_uuid(params[:captures].first) or
        general_error(404, 'resource could not be found')
      end

      # @method before_model
      # @overload GET '/:model'
      # @overload POST '/:model'
      # @overload PUT '/:model'
      # @overload PATCH '/:model'
      # @overload DELETE '/:model'
      #
      # Before handling any request for a model, the model name is mapped to an underlying resource.
      #
      # The current context is expected to respond to the `for_model` method, taking the model
      # name from the URI and returning the underlying resource.  Should the underlying resource be
      # `nil` then the response is an HTTP 404 (Not Found) containing a general error response
      # body.
      before('/:model/?:extra?', :resource => false) do
        @resource = @context.for_model(params[:model]) or
        general_error(404, 'resource could not be found')
      end

      # @method before_model
      # @overload GET '/'
      # @overload PUT '/'
      # @overload POST '/'
      # @overload PATCH '/'
      # @overload DELETE '/'
      #
      # The current context is expected to respond to `for_root`.
      # Root page.
      before('/') do
        @resource = @context.for_root
      end
      # @method before_action
      # @overload GET '/*/:action'
      # @overload POST '/*/:action'
      # @overload PUT '/*/:action'
      # @overload PATCH '/*/:action'
      # @overload DELETE '/*/:action'
      #
      # Any request, whether for a UUID or for a model, can also specify an action and that action
      # needs to be mapped appropriately.
      #
      # The current resource is expected to respond to the `action` method, taking the name of
      # the action from the URI and returning an object that behaves as a resource.  If the
      # object returned is `nil` then the response is an HTTP 400 (Bad Request) containing a
      # general error response body.
      before('/*/:action') do
        @resource = @resource.action(params[:action]) or
        general_error(400, 'action is undefined')
      end

      # @method before_body_decoding
      # @overload POST '/*'
      # @overload PUT '/*'
      # @overload PATCH '/*'
      #
      # Decode the body of the request for any requests that require it, notably HTTP
      # POST, PUT, and PATCH requests.
      #
      # The underlying resource is expected to respond to the `decoder_for` method,
      # taking the MIME type from the HTTP `Content-Type` header, and returning an object
      # that can decode the request body via the `call` method.
      #
      # If the MIME type is unrecognised then the `decoder_for` method should return
      # `nil` and the response will be an HTTP 415 (Unsupported Media Type) containing
      # a general error response body.
      before(:request_method => [ 'POST', 'PUT', 'PATCH']) do
        decoder = @resource.decoder_for(request.media_type) or
        general_error(415, 'content type cannot be decoded')

        @attributes = decoder.call(request.body)
      end

      # @method after_success
      # @overload response 200
      # @overload response 201
      #
      # After any successful response ensure that the body is properly encoded.
      #
      # The body of the response will either be the resource requested, or the result of 
      # performing an action.  It is expected to respond to the `encoder_for` method,
      # taking a list of acceptable MIME types from the HTTP `Accept` header, and returning
      # an object that will generate an encoded response.
      #
      # The encoder is expected to respond to:
      #
      # * `status`, returning the HTTP status code that should be set for the response
      # * `content_type`, returning the MIME type of the encoded HTTP response body
      # * `call`, returning the encoded body for the HTTP response
      #
      # Should the list of MIME types passed to `encoder_for` be unacceptable, the
      # method should return nil, which will cause the response to be an HTTP 406 (Content
      # not acceptable) containing a general error response body.
      after(:status => [ 200, 201 ]) do
        encoder = response.body.encoder_for(request.accept) or
        general_error(406, 'unacceptable content type requested')

        status  encoder.status
        headers 'Content-Type' => encoder.content_type
        body    encoder.call
      end

      # @method get_handler
      # @overload GET '/*'
      #
      # Handles all HTTP GET requests.  The underlying resource will be returned as through it
      # is being read.
      get('/*') { [ 200, @resource.reader.call ] }

      # @method post_handler
      # @overload POST '/*'
      #
      # Handles all HTTP POST requests.  The underlying resource is expected to respond to the
      # `creator` method, returning an action that will perform the appropriate creations.
      #
      # The `creator` method is expected to take the following arguments:
      #
      # * a context, representing the context that the action is being executed within
      # * attributes from the request body
      post('/*') { [ 201, @resource.creator(@attributes).call ] }

      # @method put_handler
      # @overload PUT '/*'
      #
      # Handles all HTTP PUT requests.  The underlying resource is expected to respond to the
      # `updater` method, returning an action that will perform the appropriate updates.
      #
      # The `updater` method is expected to take the following arguments:
      #
      # * a context, representing the context that the action is being executed within
      # * attributes from the request body
      put('/*') { [ 200, @resource.updater(@attributes).call ] }

      # @method delete_handler
      # @overload DELETE '/*'
      #
      # Handles all HTTP DELETE requests.  The underlying resource is expected to respond to the
      # `deleter` method, returning an action that will perform the appropriate deletions.
      #
      # The `updater` method is expected to take the following arguments:
      #
      #  * a context, representing the context that the action is being executed within
      delete('/*') { [ 200, @resource.deleter.call ] }

      # @method error_handler
      #
      # If an exception is raised in the underlying app,
      # it is caught in the following error block. The 
      # error message is then sent to the general_error.
      error do
        sinatra_error = request.env['sinatra.error']
        status = sinatra_error.is_a?(Lims::Core::Actions::Action::InvalidParameters) ? 422 : 500
        general_error(status, sinatra_error.message) 
      end
    end
  end
end
