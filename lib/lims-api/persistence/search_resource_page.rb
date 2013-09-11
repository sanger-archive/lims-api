require 'lims-api/core_resource_page'
require 'lims-core/persistence/search'

module Lims::Core::Persistence
  class Search
    # Display the result of a search in a page.
    # Contrary to the normal CoreResourcePage, the urls of the different actions
    # (previous, next, last...) need the search uuid and not the name of the 
    # resource. Change made in the method url_for_page.
    class SearchResourcePage < Lims::Api::CoreResourcePage
      attr_reader :search_uuid

      def initialize(context, model, name, page_number, number_per_page, search_uuid)
        @search_uuid = search_uuid
        super(context, model, name, page_number, number_per_page)
      end

      module Encoder
        include Lims::Api::Resource::Encoder

        def to_stream(s)
          s.tap do
            s.with_hash do
              actions_to_stream(s)
              s.add_key "size"
              s.add_value object.object_number
              s.add_key object.name
              s.with_array do
                object.for_each_object do |object|
                  s.with_hash do
                    object.encoder_for([content_type]).to_hash_stream(s)
                  end
                end
              end
            end
          end
        end

        # The actions urls need to use the search_uuid and not the
        # normal object.name.
        def url_for_page(page_number)
          url_for("#{object.search_uuid}/page=#{page_number}")
        end

        def url_for_action(action)
          case action.to_sym
          when :read
            url_for_page(object.page_number)
            # We don't need at that point to check the existance of previous/next page
            # as that will be filtered by the {actions} method.
          when :first
            url_for_page(1)
          when :previous
            url_for_page(object.page_number-1)
          when :next
            url_for_page(object.page_number+1)
          when :last
            url_for_page(-1)
          else
            raise RuntimeError, "Unexpected action '#{action}'"
          end
        end
      end

      Encoders = [
        class JsonEncoder
          include Encoder
          include Lims::Api::JsonEncoder
        end
      ]

      def self.encoder_class_map 
        @encoder ||= Encoders.mash { |k| [k::ContentType, k] }
      end
    end
  end
end
