require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Pool < Fog::Model

        identity  :poolid
        
        attribute :comment
        attribute :members

        attr_accessor :loaded

        def initialise
          self.loaded = false
          super
        end
        
        def save(newoptions = {})
          options = attributes.merge newoptions
          options.merge! service_defaults

          if self.loaded then
            service.update_pool( options )
          else
            service.create_pool( options )
          end
          true
        end
        
        def destroy
          service.delete_pool( service_defaults )
          true
        end
        
        private
        
        def service_defaults
          requires :poolid
          
          {
            'poolid' => poolid,
          }
        end

      end

    end
  end
end
