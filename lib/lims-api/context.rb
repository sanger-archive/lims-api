require 'lims-api/core_resource'
require 'lims-api/core_class_resource'
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
      #===================================================
      # Core specific
      #===================================================

      # Create a resource bound to model class found in Lims::Core
      # @param [String] name of the class to find
      # @return [Resource, nil]
      def for_model(plural_name)
        plural_name = plural_name.to_s
        name = plural_name.singularize

        # we check the name wasn't already the singular
        return nil if name.pluralize != plural_name
        model = find_model_class(name)
        model ?  CoreClassResource.new(self, model, plural_name) : nil
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
        @store.with_session do |session|
          @last_session = session
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
        end
        action.result
      end

      #===================================================
      # Server specific
      #===================================================
      #===================================================
      # Encoder Helpers
      #===================================================

    def uuid_for(object)
        raise RuntimeError, "Context doesn't have a session" unless last_session
        last_session.uuid_for(object)
    end
    end
  end
end
