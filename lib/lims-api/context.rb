require 'lims-api/core_resource'
require 'lims-api/core_class_resource'
require 'lims-api/core_action_resource'
require 'lims-api/action_selector_resource'
require 'lims-api/resources'

require 'active_support/inflector'

module Lims
  module Api
    # Context to a run a request.
    # It creates the appropriate Resource classes.
    # Has a store, and keep internally the last session
    # to be able to keep cache of uuid etc ...
    class Context
      # Create a context with the specific store
      # @param [Lims::Core::Persistence::Store] store the store to retriev/store objects.
      def initialize(store, url_generator)
        @store = store
        @last_session = nil
        @url_generator = url_generator
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

      #===================================================
      # Core specific
      #===================================================

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
        klass = find_action_class(action_name)
        klass ? CoreActionResource.new(self, klass, action_name) : nil
      end

      # Find the action class corresponding to the name
      # (in Lims::Core::Actions)
      # @param [String] name
      # @return [Class, nil]
      def find_action_class(name)
        klass = Core::Actions.const_get(name.camelcase)
        klass.ancestors.include?(Core::Actions::Action) ? klass : nil
      end

      # Find the class corresponding to the name
      # in the submodule of Lims::Core.
      # @param [String] 
      # @return [Class, nil]
      def find_model_class(name)
        ModelToClass[name]
      end

      # Find the name (used in URL) for a specific class
      # Inverse of {find_model_name}.
      # @param [Class]
      # @return [String,nil]
      def find_model_name(klass)
        ClassToModel[klass]
      end


      # Computes the hash model->name to class
      # Acheives it by iterator over all the classes
      # and look for {Lims::Core::Resource Resource}
        ModelToClass  = {}.tap do |h|
          Lims::Core::constants.each do |module_name|
            mod = Lims::Core.const_get(module_name)
            next unless mod.is_a?(Module)

            mod.constants.each do |name|
              model = mod.const_get(name)
              h[name.to_s.snakecase]=model if model && model.ancestors.include?(Core::Resource)
            end
          end
        end

        ClassToModel = ModelToClass.inverse()

      # look up into the uuid table to find the type of the resource
      # but don't load yet the actual object.
      def for_uuid(uuid)
        with_session do |session|
          session.uuid_resource[:uuid => uuid]
        end.andtap do |uuid_resource|
          ModelClassToResourceClass[uuid_resource.model_class].andtap do |resource_class|
          resource_class.new(self, uuid_resource, find_model_name(uuid_resource.model_class))
          end
        end

      end

      # Find the resource class for a class
      # @param [Class] klass 
      # @return [Class]
      def resource_class_for_class(klass)
        ModelClassToResourceClass[klass]
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
      def resource_for(object, name, uuid=nil)
        uuid ||= uuid_for(object)
        resource_class_for(object).new(self, Core::Uuids::UuidResource.new(:uuid => uuid),  name, object)
      end

      # Computes the hash model -> Resource Class
      # It looks for a specific class in Lims::Api::Resources
      # and use as CoreResource. This method pre-compute the lookup.
      ModelClassToResourceClass = {}.tap do |h|
        Lims::Core::constants.each do |module_name|
          mod = Lims::Core.const_get(module_name)
          next unless mod.is_a?(Module)

          mod.constants.each do |name|
            # name is the bare name: e.g. for   Lims::Core::Laboratory::Plate
            # - module_Name = Laboratory
            # - name = Plate
            model = mod.const_get(name)
            resource_name = "#{name}Resource"
            begin
              resource_class = Lims::Api::Resources.const_get(resource_name)
              #puts "found #{resource_name}, use default instead"
            rescue NameError
              #puts "couldn't find #{resource_name}, use default instead"
              resource_class = CoreResource
            end
            h[model] = resource_class
          end
        end
      end


      # Execute a session an store the used session
      # @param [Lims::Core::Actions::Action] action.
      # @return [Object] the result of the action
      def execute_action(action)
        action.call do |action, session|
          @last_session = session
        end && action.result
      end

      # Create an action from the specified class.
      # attributes are also set.
      # @param [Class] action_class .
      # @param [Hash] attributes to create the actions.
      # @return [Lims::Core::Actions::Action]
      # @todo add user and 
      def create_action(action_class, attributes)
        action = action_class.new( :store => store, :user => "user", :application => "application") do |a, session|
          recursively_load_uuid(attributes, session) .each do |k,v|
            a[k] = v
          end
        end
      end

      # Replace recursively key/value pairs corresponding to an uuid by the corresponding resource pair
      # @example
      # { :sample_uuid => '134'} => { :sample => SampleResource }
      # @param [Hash<String,Arrays>] a structure
      # @param [Lims::Core::Persistence::Session] session needed to load the object
      # @return [Hash<String,Arrays>
      def recursively_load_uuid(attributes, session)
        attributes.mashr do |k, v|
          case k
          when /(.*)_uuid\Z/
            [$1, session[v]]
          else
            [k,v]
          end
        end
      end


      private :resource_class_for_class
      def model_count(session, model)
        session.persistor_for(model).count
      end
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
        raise RuntimeError, "Context doesn't have a session" unless last_session
        last_session.uuid_for(object)
      end
    end
  end
end
