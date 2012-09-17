require 'lims-api/resource'
module Lims
  module Api
    # This resource holds and allow to *select* via `action`
    # a Core Action.
    # @todo add encoder if we want to display an instance of it.
    # probably the list of available resource
    class ActionSelectorResource
        include Resource
        # build an resource corresponding to a Core::Actions::Action
        def action(name)
          @context.for_action(name)
        end
    end
  end
end
