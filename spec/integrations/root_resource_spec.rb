require 'spec_helper'
require 'integrations/spec_helper'

require 'lims-api/root_resource'
require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'




module Lims
  module Api
    describe RootResource do
      context "with a valid context" do
        include_context "use core context service"
        include_context "JSON"
        it "display the table of content" do
          get("/").body.should include_json({
            :plates => {
            :actions => {
            :read => 'http://example.org/plates',
            :create => 'http://example.org/plates',
            :first => 'http://example.org/plates/page=1',
            :last => 'http://example.org/plates/page=-1'
          }
          } ,
           :plate_transfers => {
              :actions => {
              :create => 'http://example.org/actions/plate_transfer'
          }
          } ,
          :revision => 3
          })
        end
      end
    end
  end
end

