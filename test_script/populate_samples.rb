#!ruby
require 'lims-core'
require 'lims-api/sequel'

#require 'lims-core/uuids'
module Lims
  module Core

    def self.populate_samples(env)
      store = Api::Sequel::create_store(env)
      store.with_session do |session|
        1.upto(10) do |i|
          # we are creating sample manually, the core doesn't allow this yet
          # as they are supposed to be external and so , read-only.
          sample_id = store.database[:samples].insert({ :name => "sample ##{i}" })
          sample = session.sample[sample_id]
          uuid = ["%x"%i,"0","1","0", "1" ].zip(Uuids::UuidResource::Form).map { |c,n| c*n}.join("-")
          puts "UUID #{uuid}"
          session << Uuids::UuidResource.new(:key => sample_id, :model_class => sample.class, :uuid => uuid)
        end
      end
    end

    populate_samples(:development)
  end
end
