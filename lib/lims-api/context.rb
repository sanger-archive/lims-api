require 'lims-api/core_resource'
require 'lims-api/core_class_resource'
require 'lims-api/core_action_resource'
require 'lims-api/resource_container'
require 'lims-api/action_selector_resource'
require 'lims-api/root_resource'
require 'lims-api/resources'
require 'lims-api/persistence/search_resource'
require 'lims-api/mime_typed'

require 'lims-core/actions/bulk_action'

require 'active_support/inflector'

require 'lims-core/actions'
if defined?(Lims::Core::NO_AUTOLOAD)
  require 'lims-core/persistence/sequel'
else
  require 'lims-core'
end

module Lims
  module Api
    # Context to a run a request.
    # It creates the appropriate Resource classes.
    # Has a store, and keep internally the last session
    # to be able to keep cache of uuid etc ...
    class Context
      include MimeTyped

      # Create a context with the specific store
      # @param [Lims::Core::Persistence::Store] store the store to retriev/store objects.
      # @param [Lims::Core::Persistence::MessageBus] bus to publish messages
      # @param [String] application_id
      # @param [Lambda] url_generator function to generate full url from path
      # @param [MimeType] content_type
      def initialize(store, message_bus, application_id, url_generator, content_type)
        @store = store
        @last_session = nil
        @url_generator = url_generator
        @application_id = application_id
        @message_bus = message_bus
        super(content_type)
      end

      attr_reader :store
      attr_reader :last_session


      def url_for(path)
        @url_generator.call(path)
      end

      def with_session(&block)
        @store.with_session do |session|
          @last_session = session
          block.call(session)
        end
      end

      def api_version
        3
      end

      #===================================================
        # Core specific
      #===================================================

        #--------------------------------------------------
        # Resource creation
      #--------------------------------------------------

        # Create a resource bound to model class found in Lims::Core
      # @param [String] name of the class to find
      # @return [Resource, nil]
      def for_model(plural_name)
        return ActionSelectorResource.new(self) if plural_name == "actions"
        plural_name = plural_name.to_s
        name = plural_name.singularize

        # we check the name wasn't already the singular
        return nil if name.pluralize != plural_name
        model = find_model_class(name)
        model ?  CoreClassResource.new(self, model, plural_name) : nil
      end

      def for_action(action_name)
        find_action_class(action_name).andtap do |klass|
          resource_class = resource_class_for_class(klass) 
          resource_class.new(self, klass, action_name)
        end
      end

      def for_root()
        resource_map = {}
        # find and add core resource
        self.class.discover_resource_classes
        @@model_to_class.each do |name, model|
          next unless model.ancestors.include?(Lims::Core::Resource)
          next if model.const_defined? :NOT_IN_ROOT
          name = name.pluralize
          for_model(name).andtap do |resource|
            resource_map[name]= resource
          end
        end

        # find and add core actions
        @@action_to_class.each do |action, klass|
          next if klass.const_defined? :NOT_IN_ROOT
          for_action(action).andtap do|resource|
            resource_map[action.pluralize]= resource
          end
        end

        return RootResource.new(self, resource_map)
      end

      #--------------------------------------------------
        # Helpers
      #--------------------------------------------------

        # Find the action class corresponding to the name
      # (in Lims::Core::Actions)
      # @param [String] name
      # @return [Class, nil]
      def find_action_class(name)
        self.class.discover_resource_classes
        @@action_to_class[name]
      end

      # Find the name for a specific action class
      # Inverse of {find_action_class}
      # @param [Class]
      # @return [String, nil]
      def find_action_name(klass)
        self.class.discover_resource_classes
        @@class_to_action[klass]
      end

      # Find the class corresponding to the name
      # in the submodule of Lims::Core.
      # @param [String] 
      # @return [Class, nil]
      def find_model_class(name)
        self.class.discover_resource_classes
        @@model_to_class[name]
      end

      # Find the name (used in URL) for a specific class
      # Inverse of {find_model_name}.
      # @param [Class]
      # @return [String,nil]
      def find_model_name(klass)
        self.class.discover_resource_classes
        @@class_to_model[klass]
      end

      # Find the  plural name (used) for a specific class
      # Inverse of for_model
      # @param [Class]
      # @return [String, nil]
      def find_models_name(klass)
        find_model_name(klass).pluralize
      end

      # look up into the uuid table to find the type of the resource
      # but don't load yet the actual object.
      def for_uuid(uuid)
        with_session do |session|
          session.uuid_resource[:uuid => uuid]
        end.andtap do |uuid_resource|
            resource_class_for_class(uuid_resource.model_class).andtap do |resource_class|
              resource_class.new(self, uuid_resource, find_model_name(uuid_resource.model_class))
            end
          end

        end

        # Find the resource class for a class
        # @param [Class] klass 
        # @return [Class]
        def resource_class_for_class(klass)
          self.class.discover_resource_classes
          @@model_class_to_resource_class[klass]
        end

        # Finds the resource class for an object
        # @param [Object] object 
        # @return [Class]
        def resource_class_for(object)
          resource_class_for_class(object.class)
        end

        # @param [Object] object underlying to the resource
        # @param [String] name name used in the json (singular)
        # @param [String] uuid if known
        def resource_for(object, name=nil, uuid=nil)
          name ||= find_model_name(object.class)
          uuid ||= uuid_for(object)
          resource_class_for(object).new(self, Core::Persistence::UuidResource.new(:uuid => uuid),  name, object)
        end

        def encoder_for(object, mimes)
          mimes = mimes.map { |m| MimeType::to_mimetype(m) }
          resource = resource_for(object)
          resource.encoder_for(mimes)
        end


        # Computes the hash model -> Resource Class
        # It looks for a specific class in Lims::Api::Resources
        # and use as CoreResource. This method pre-compute the lookup.
        @@model_class_to_resource_class = {}

        # Execute a session an store the used session
        # @param [Lims::Core::Actions::Action] action.
        # @return [Object] the result of the action
        def execute_action(action)
          begin
            action.call && action.result
          rescue Lims::Core::Actions::Action::InvalidParameters => e
            # Errors on Action attributes carry the action attribute name
            # not the name appearing in the json , we need to map it back.
            raise e.class, resource_class_for_class(action.class)::filter_errors(e.errors, self, @last_session)
          end
        end

        # Create an action from the specified class.
        # attributes are also set.
        # @param [Class] action_class .
        # @param [Hash] attributes to create the actions.
        # @return [Lims::Core::Actions::Action]
        # @todo add user and 
        def create_action(action_class, attributes, resource_class=nil)
          resource_class ||= resource_class_for_class(action_class)
          action = action_class.new( :store => store, :user => "user", :application => "application") do |a, session|
            @last_session = session
            resource_class::filter_attributes_on_create(attributes, self, session) .each do |k,v|
              a[k] = v
            end
          end
        end

        # @param [Hash] result
        # @return [Resource]
        def resource_for_create_result(result)
            uuid = result.delete(:uuid)
            type = result.keys.first
            object = result[type]
            resource_for(object, type, uuid).tap do |resource|
              publish("create", resource)
            end
        end

        def core_resource_creator(model, attributes)
          name = find_model_name(model)
          create_attributes = attributes.fetch(name, nil)
          raise Lims::Core::Actions::Action::InvalidParameters, {name => ["missing parameter"]}   if create_attributes  == nil

          lambda do 
            action = create_action(model::Create, create_attributes)
            resource_for_create_result(execute_action(action))
          end
        end

        def create_bulk_action(element_name, group_name, action_class, attributes)
          bulk_action_class = Class.new do
            include Lims::Core::Actions::BulkAction
            initialize_class(nil, group_name, action_class)
          end
          create_action(bulk_action_class, attributes, resource_class_for_class(action_class))
        end

        module Bulk
          def core_resource_creator(model, attributes)
            name = find_model_name(model)
            plural_name = find_model_name(model).pluralize
            create_attributes = attributes.fetch(plural_name, nil)
            raise Lims::Core::Actions::Action::InvalidParameters, {name => ["missing parameter"]}   if create_attributes  == nil

            lambda do 
              action = create_bulk_action(name, plural_name, model::Create, attributes)
              execute_action(action)

              ResourceContainer.new(self,
                action.result[plural_name].map do |r|
                  resource_for_create_result(r)
                end,
                plural_name
              )
            end
          end
        end

        # Replace recursively key/value pairs corresponding to an uuid by the corresponding resource pair
        # If the resource associated to the uuid doesn't exist, we keep the uuid.
        # @example
        # { :sample_uuid => '134'} => { :sample => SampleResource }
        # @param [Hash<String,Arrays>] a structure
        # @param [Lims::Core::Persistence::Session] session needed to load the object
        # @return [Hash<String,Arrays>
          def recursively_load_uuid(attributes, session)
            attributes.mashr do |k, v|
              case k
              when /(.*)_uuid\Z/
                resource = session[v]
                resource ? [$1, resource] : [k,v]
              else
                [k,v]
              end
            end
          end

          # Delete error messages related to uuid attribute.
          # If an uuid is invalid or not found, it won't have been translated to the bare attribute
          # example plate and plate_uuid.
          # plate_uuid is in the JSON whereas plate is the action attribute.
          # If plate_uuid is invalid we'll get 2 errors, NoMethodError on plate_uuid
          # and plate being blank.
          def filter_uuid_errors(errors, session)
            errors.each do |key,value|
              case key
              when /(.*)_uuid\Z/
                value.each { |s| s.sub!(/.*(?=value )/, '') if errors.delete($1.to_sym) } # delete action attribute and fix error message
              end
            end
            errors
          end

          private :resource_class_for_class
          def model_count(session, model)
            session.persistor_for(model).count
          end

          #--------------------------------------------------
            # Message Bus
          #--------------------------------------------------

      # Publish a message on the bus and route it with a routing key.
      # @param [Class, String] action 
      # @param [Hash, nil] resource to publish 
      def publish(action, resource)
        action = find_action_name(action) unless action.is_a? String
        payload = message_payload(action, resource)
        routing_key = resource.routing_key(action)
        metadata = {:routing_key => routing_key, :app_id => @application_id}
        @message_bus.publish(payload.to_json, metadata)
      end

          # Build the message payload
          # The message should contain the resource affected by the action,
          # the action name, the date, and the user which performed the action.
          # @param [String] action name
          # @param [Hash] resource to publish
          def message_payload(action, resource)
            payload = JSON.parse(resource.encoder_for(['application/json']).call)
            payload.merge!({:action => action, :date => Time.now.utc, :user => "user"})
          end
          private :message_payload


          #===================================================
            # Server specific
          #===================================================
            #===================================================
            # Encoder Helpers
          #===================================================

            # Find the uuid of an object if exists
          # @param object
          # @return [String, nil]
          def uuid_for(object)
            case object
            when String
              # The object might be already an uuid, let's check ...
              if Core::Persistence::UuidResource::ValidationRegexp =~ object
                return object
              else
                raise RuntimeError, "'#{object}' invalid resource"
              end
            else
              raise RuntimeError, "Context doesn't have a session" unless last_session
              last_session.uuid_for(object)
            end
          end


          def self.classname_for(klass)
            klass.name.andtap { |_| _.split('::').pop }
          end

          private_class_method :classname_for
          def self.resource_class_for(klass, class_name)
            resource_name = "#{class_name}Resource"
            # find and build if necessary the corresponding API resource class
            # find the API resource in the class itself.
            if klass.const_defined?(resource_name)
              return klass.const_get(resource_name)
            elsif klass.respond_to?(:parent_scope) && klass.parent_scope.andtap { |scope| scope.const_defined?(resource_name) }
              return klass.parent_scope.const_get(resource_name)
            else
              # iterate over included mixin to check if some resource
              # have been defined for them
              klass.included_modules.each do |mixin|
                name = classname_for(mixin)
                next unless name
                resource_class_for(mixin, name).andtap { |_| return _ }
              end
            end
            return nil
          end
          private_class_method :resource_class_for

          # This method discovers and registers all needed classes.
          # It mainly populates the xToy maps.
          def self.discover_resource_classes()
            return if @__discovery_done
            @@model_to_class = {}
            @@action_to_class = {}

            # Iterate over each object to find the required classes
            ObjectSpace.each_object do |klass|
              next unless klass.is_a?(Class)
              next unless klass.name.is_a?(String)

              name = classname_for(klass)
              snakename = name.snakecase

              # if the class is a core resource
              # register it as a resource
              if klass.ancestors.include?(Core::Resource)
                @@model_to_class[snakename] = klass

                resource_class = resource_class_for(klass, name) ||  CoreResource
                @@model_class_to_resource_class[klass] = resource_class
              end

              # if the class is a core action
              # register it as an action
              if klass.ancestors.include?(Core::Actions::Action)
                @@action_to_class[snakename] = klass
                resource_class = resource_class_for(klass, name) ||  CoreActionResource
                @@model_class_to_resource_class[klass] = resource_class
              end

            end

            @@class_to_model = @@model_to_class.inverse()
            @@class_to_action = @@action_to_class.inverse

            @__discovery_done = true
          end
        end
      end
    end
