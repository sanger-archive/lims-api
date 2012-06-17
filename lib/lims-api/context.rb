require 'lims-core'
require 'lims-api/core_resource'
require 'lims-api/core_class_resource'

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

      # find a model in the submodule of Lims::Core
      # @param [String] name of the class to find
      # @return [Resource, nil]
      def for_model(name)
        #model = Resources::const_get(name)
        model = xfor_model(name)
        model ?  CoreClassResource.new(model) : nil
      end

      def xfor_model(name)
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
