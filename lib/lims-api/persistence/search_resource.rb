#search_resource.rb
require 'lims-api/context'
require 'lims-api/core_class_resource'
require 'lims-api/core_resource_page'
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
require 'lims-api/persistence/search_resource_page'

require 'lims-core/persistence/search'
module Lims::Core
  module Persistence
    class Search
      class SearchResource < Lims::Api::CoreResource
        def actions
          %w(read first last)
        end

        def action(action_name)
          @context.with_session do |session|
            search = object(session)
            case action_name
            when /page=(-?\d+)/
              SearchResourcePage.new(@context,
                search.call(session), @context.find_models_name(search.model), $1.to_i,
                Lims::Api::CoreClassResource::NUMBER_PER_PAGES, session.uuid_for(search))
            end
          end
        end

        def content_to_stream(s, mime_type)
        end

        def name
          "search"
        end
        #==================================================
          # Encoders
        #==================================================

          # Specific encoder
        module  Encoder
          include Lims::Api::CoreResource::Encoder
          #@todo DRY with CoreClassResource
          def url_for_action(action)
            url_for(
              case action
              when "first" then "#{path}/page=1"
              when "last" then "#{path}/page=-1"
              when "read", "create" then "#{path}"
              else
                super(action)
              end
            )
          end
          def path
            object.uuid
          end
        end

        Encoders = [
          class JsonEncoder
            include Encoder
            include Lims::Api::JsonEncoder
          end
        ]
        def self.encoder_class_map 
          Encoders.mash { |k| [k::ContentType, k] }
        end
      end
    end
  end
end
