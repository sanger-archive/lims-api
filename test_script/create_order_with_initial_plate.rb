#!ruby
require 'lims-core'
require 'lims-api/sequel'

#require 'lims-core/uuids'
module Lims
  module Core
    module TestScript

      class CreateOrder

        def initialize(env)
          @store = Api::Sequel::create_store(env)
          @user = Organization::User.new
          @application = "pulldown"
        end

        def create_target_tube(attr = {}) 
          action = Actions::CreateTube.new(:store => @store, :user => @user, :application => @application) do |a,s|
            a.aliquots = attr[:aliquots] if attr[:aliquots]
          end 

          response = action.call
          response[:uuid]
        end

        def create_initial_plate(attr)
          action = Actions::CreatePlate.new(:store => @store, :user => @user, :application => @application) do |a,s|
            a.number_of_rows = attr[:rows] if attr[:rows]
            a.number_of_columns = attr[:columns] if attr[:columns]
            a.wells_description = attr[:wells] if attr[:wells]
          end 

          response = action.call
          response[:uuid]
        end

        def study
          Organization::Study.new
        end

        def create_order(attr)
          action = Actions::CreateOrder.new(:store => @store, :user => @user, :application => @application) do |a,s|
            a.pipeline = attr[:pipeline] if attr[:pipeline]
            a.parameters = attr[:parameters] if attr[:parameters]
            a.sources = attr[:sources] if attr[:sources]
            a.targets = attr[:targets] if attr[:targets]
            a.study = study
            a.cost_code = attr[:cost_code] if attr[:cost_code]
          end

          response = action.call
          response
        end

        def update_order(order)
        action = Actions::UpdateOrder.new(:store => @store, :user => @user, :application => @application) do |a,s|
          a.items = {"test" => {"uuid" => "3f989a70-1adc-0130-7de1-282066132de2"} }
          a.order = order
        end
        action.call
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

     plate_uuid2 = test.create_initial_plate({
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

      order = test.create_order({
        :pipeline => "P1", 
        :parameters => {},
        :sources => {:parent_plate => plate_uuid, :parent_plate2 => plate_uuid2},
        :targets => {:target_tube => tube_uuid}, 
        :cost_code => "cost code"})

#      puts test.update_order(order[:order])

    end
  end
end
