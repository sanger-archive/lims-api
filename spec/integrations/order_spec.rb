require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/lab_resource_shared'
require 'integrations/spec_helper'

require 'lims-api/resource_shared'

describe Lims::Core::Organization::Order do
  include_context "use core context service", :items, :orders, :studies, :users, :uuid_resources 
  include_context "JSON"

  context "create an order" do
    let(:url) { "/actions/create_order" }

    context "with empty parameters" do
      let(:parameters) { {} }
      let(:expected_json) { {"errors" => {"study" => "invalid", "cost_code" => "invalid"}} }
      it_behaves_like "an invalid core action", 422
    end

    context "with correct parameters" do
      let(:study_uuid) { "55555555-2222-3333-6666-777777777777".tap do |uuid|
        store.with_session do |session|
          study = Lims::Core::Organization::Study.new
          session << study
          set_uuid(session, study, uuid)
        end
      end
      } 

      let(:user_uuid) { "66666666-2222-4444-9999-000000000000".tap do |uuid|
        store.with_session do |session|
          user = Lims::Core::Organization::User.new
          session << user
          set_uuid(session, user, uuid)
        end
      end
      }

      let(:cost_code) { "cost code" }
      let(:pipeline) { "pipeline" }
      let(:sources) { {:source_role1 => "99999999-2222-4444-9999-000000000000"} }
      let(:targets) { {:target_role1 => "99999999-2222-4444-9999-111111111111" } }
      let(:parameters) { {:user_uuid => user_uuid, 
        :study_uuid => study_uuid,
        :sources => sources, 
        :targets => targets,
        :cost_code => cost_code,
        :pipeline => pipeline} }

      let(:expected_json) { 
        user_url = "http://example.org/#{user_uuid}"
        study_url = "http://example.org/#{study_uuid}"
        {:create_order => 
          {:actions => {}, 
           :user => 
            {:user => 
              {:actions => 
                {:read => user_url, 
                 :create => user_url, 
                 :update => user_url, 
                 :delete => user_url}, 
                 :uuid => user_uuid}}, 
               :application => "application", 
               :pipeline => pipeline, 
               :parameters => {}, 
               :sources => sources,
               :targets => targets, 
               :study => 
                {:study => 
                  {:actions => 
                    {:read => study_url, 
                      :create => study_url, 
                     :update => study_url, 
                     :delete => study_url}, 
                  :uuid => study_uuid}}, 
                :cost_code => cost_code}}
      }

      it_behaves_like "a valid core action" do
      end
    end
  end 
end
