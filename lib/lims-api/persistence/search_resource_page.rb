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
        include Lims::Api::CoreResourcePage::Encoder

        # The actions urls need to use the search_uuid and not the
        # normal object.name.
        def url_for_page(page_number)
          url_for("#{object.search_uuid}/page=#{page_number}")
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
