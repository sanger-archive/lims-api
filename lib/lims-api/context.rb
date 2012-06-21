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
      # This method could be a class one and been memoize if needed.
      # @param [String] 
      # @return [Class, nil]
      def find_model_class(name)
        # memoize at application level if needed
        Lims::Core::constants.each do |module_name|
          mod = Lims::Core.const_get(module_name)
          next unless mod.is_a?(Module)

          begin
            model = mod.const_get(name.capitalize)
          rescue NameError
          end
          return model if model && model.ancestors.include?(Core::Resource)
        end
        nil
      end

      #===================================================
      # Server specific
      #===================================================
    end


  end
end
