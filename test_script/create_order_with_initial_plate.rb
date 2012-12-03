#!ruby
require 'lims-core'
require 'lims-api/sequel'

module Lims
  module Core
    module TestScript

      class CreateOrder

        INITIAL_PLATE_TYPE = "WGS stock DNA"
        TUBE_TYPE = "MX tube"

        def initialize(env)
          @store = Api::Sequel::create_store(env)
          @user = Organization::User.new
          @application = "pulldown"
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
      plate_uuid = test.create_initial_plate({
        :rows => 8,
        :columns => 12,
        :wells => {
          "A12" => [{"sample_uuid" => "11111111-0000-1111-0000-111111111111"}, 
                    {"sample_uuid" => "66666666-0000-1111-0000-111111111111"} ], 
          "B11" => [{"sample_uuid" => "22222222-0000-1111-0000-111111111111"}], 
          "C10" => [{"sample_uuid" => "33333333-0000-1111-0000-111111111111"}], 
          "D9" => [{"sample_uuid" => "44444444-0000-1111-0000-111111111111"}], 
          "E8" => [{"sample_uuid" => "55555555-0000-1111-0000-111111111111"}]} })  

      tube_uuid = test.create_target_tube

      order_uuid = test.create_order({
        :pipeline => "Illumina A", 
        :parameters => {:sequencing_pool => test.sequence_capture_pool},
        :sources => {CreateOrder::INITIAL_PLATE_TYPE => plate_uuid},
        :targets => {CreateOrder::TUBE_TYPE => tube_uuid}, 
        :cost_code => "123456"})

      test.update_order({:order_uuid => order_uuid, :event => :build})
      test.update_order({:order_uuid => order_uuid, :event => :start})
    end
  end
end
