module Lims::Api
  module Resources
    module CreateContainer

      def self.included(klass)
        klass.instance_eval do
          # Utility method for ensuring that the UUID fields in each aliquot of the well description
          # hash is mapped correctly.  The block controls the direction of the mapping.
          def map_element_descriptions(elements_description, &block)
            elements_description.update_values do |aliquots|
              aliquots.map do |aliquot|
                aliquot.update(aliquot.subset(UUID_FIELDS_IN_ALIQUOT).update_values(&block))
              end
            end unless elements_description.nil?
          end
    
          # The specific container should implement this method
          # and return the proper element with String type
          # i. e. 'wells_description'
          def element_attr
            raise NotImplementedError 
          end
    
          # The specific container should implement this method
          # and return the proper element with Symbol type
          # i. e. :wells_description
          def element_attr_sym
            raise NotImplementedError
          end
    
          def filter_attributes_on_create(attributes, context, session)
            super.tap do |new_attributes|
              map_element_descriptions(new_attributes[element_attr]) { |v| session[v] }
            end
          end
        end
      end

      UUID_FIELDS_IN_ALIQUOT = [ 'sample', 'tag', 'snp_assay' ]
      
      

      def filtered_attributes
        super.tap do |attributes|
          self.class.map_element_descriptions(attributes[self.element_attr_sym]) { |v| @context.uuid_for(v) || v }
        end
      end
    end
  end
end
