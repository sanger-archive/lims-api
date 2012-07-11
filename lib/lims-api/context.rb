require 'lims-core'
require 'lims-api/core_resource'
require 'lims-api/core_class_resource'

require 'active_support/inflector'

module Lims
  module Api
    module Resources
    end
    class Context
      # Create a context with the specific store
      # @param [Lims::Core::Persistence::Store] store the store to retriev/store objects.
      def initialize(store)
        @store = store
      end

      attr_reader :store

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
        model ?  CoreClassResource.new(model, plural_name) : nil
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
          session.uuid_resource[:uuid => uuid]
        end.andtap do |uuid_resource|
          CoreResource.new(uuid_resource, find_model_name(uuid_resource.model_class))
        end

      end
      #===================================================
      # Server specific
      #===================================================
    end


  end
end
