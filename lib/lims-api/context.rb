require 'lims-core'

C = Lims::Core
P = Lims::Core::Persistence
module Lims::Api
  class Context
    # Create a context with the specific store
    # @param [P::Store] store the store to retriev/store objects.
    def initialize(store)
      @store = store
    end

    #===================================================
    # Core specific
    #===================================================

    # find a model in the submodule of Lims::Core
    # @param [String] name of the class to find
    # @return [Class, nil]
    def for_model(name)
      # memoize at application level if needed
      Lims::Core::constants each do |module_name|
        mod = Lims::Core.const_get(n)
        next unless mod.is_a?(Module)

        model = mod.const_get(name)
        model.is_a?(C::Resource) ? model : nil
      end
    end

    #===================================================
    # Server specific
    #===================================================
  end
end
