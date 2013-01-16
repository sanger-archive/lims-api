#!ruby
require 'lims-core'
require 'lims-api/sequel'
require 'rubygems'
require 'ruby-debug/debugger'


module Lims
  module Core
    module TestScript

      class CreateOrder

        INITIAL_PLATE_TYPE = "WGS stock DNA"
        TUBE_TYPE = "MX tube"

        def self.pick(n, list)
          return list.map(&method(:Array)) if n == 1
          list.inject([]) { |a,e| a.concat(self.pick(n-1, list).map { |v| [e,*v] }) }
        end

        ALL_WELLS = ('A'..'H').map { |r| (1..12).map { |c| "#{r}#{c}" } }.flatten
        TAG_OLIGOS = CreateOrder.pick(4, ['A','C','G','T']).map(&:join).slice(0, ALL_WELLS.size)

        def initialize(env)
          @store = Api::Sequel::create_store(env)
          @user = Organization::User.new
          @application = "pulldown"
        end

        def create_oligos(attr = {})
          @store.with_session do |session|
            TAG_OLIGOS.map do |sequence|
              oligo = Laboratory::Oligo.new(:sequence => sequence)
              session << oligo
              session.uuid_for!(oligo)
            end   
          end
        end

        def create_samples(number)
          sample_names = (1..number).to_a.map { |n| "sample in #{n}" }
          @store.with_session do |session|
            sample_names.map do |name|
              sample = Laboratory::Sample.new(:name => name)
              session << sample
              session.uuid_for!(sample)
              sample
            end
          end
        end

        def create_target_tube(attr = {}) 
          Actions::CreateTube.new(:store => @store, :user => @user, :application => @application) do |a,s|
            a.aliquots = attr[:aliquots] if attr[:aliquots]
          end.call[:uuid] 
        end

        def create_initial_plate(attr)
          Actions::CreatePlate.new(:store => @store, :user => @user, :application => @application) do |a,s|
            a.number_of_rows = attr[:rows] if attr[:rows]
            a.number_of_columns = attr[:columns] if attr[:columns]
            a.wells_description = attr[:wells] if attr[:wells]
          end.call[:uuid] 
        end

        def study
          Organization::Study.new
        end

        def sequence_capture_pool
          transfers = {}
          %w(A B C D E F G H).each do |letter|
            (1..12).to_a.each do |num| 
              transfers["#{letter}#{num}"] = "A1"
            end
          end
          transfers
        end

        def create_order(attr)
          Actions::CreateOrder.new(:store => @store, :user => @user, :application => @application) do |a,s|
            a.pipeline = attr[:pipeline] if attr[:pipeline]
            a.parameters = attr[:parameters] if attr[:parameters]
            a.sources = attr[:sources] if attr[:sources]
            a.targets = attr[:targets] if attr[:targets]
            a.study = study
            a.cost_code = attr[:cost_code] if attr[:cost_code]
          end.call[:uuid]
        end

        def update_order(attr)
          Actions::UpdateOrder.new(:store => @store, :user => @user, :application => @application) do |a,s|
            a.order = s[attr[:order_uuid]]
            a.event = attr[:event] if attr[:event]
            a.state = attr[:state] if attr[:state]
          end.call
        end
      end


      test = CreateOrder.new(:development)

      sample = test.create_samples(6)

      plate_uuid = test.create_initial_plate({
        :rows => 8,
        :columns => 12,
        :wells => {
          "A12" => [{"sample" => sample[0]}, 
                    {"sample" => sample[1]} ], 
          "B11" => [{"sample" => sample[2]}], 
          "C10" => [{"sample" => sample[3]}], 
          "D9" => [{"sample" => sample[4]}], 
          "E8" => [{"sample" => sample[5]}]} })  

      tube_uuid = test.create_target_tube
      tag_uuids = test.create_oligos    

      order_uuid = test.create_order({
        :pipeline => "Illumina A", 
        :parameters => {:sequencing_pool => ["A12", "B11", "C10", "D9", "E8"]},
        :sources => {CreateOrder::INITIAL_PLATE_TYPE => plate_uuid},
        :targets => {CreateOrder::TUBE_TYPE => tube_uuid}, 
        :cost_code => "123456"})

      test.update_order({:order_uuid => order_uuid, :event => :build})
      test.update_order({:order_uuid => order_uuid, :event => :start})
    end
  end
end
