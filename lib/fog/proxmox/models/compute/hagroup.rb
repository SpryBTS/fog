require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Hagroup < Fog::Model

        identity  :id

        attribute :autostart
        attribute :text
        attribute :vmid

        attr_accessor :loaded

        def initialise
          self.loaded = false
          super
        end
        
        def save
          requires :vmid

          options = {
            'autostart' => autostart,
          }

          if self.loaded then
            options.merge!( 'id' => id )
            service.cluster_ha_group( options.merge!( :method => :put ) )
          else
            options.merge!( 'vmid' => vmid )
            service.cluster_ha_groups( options.merge!( :method => :post ) )
          end
          true
        end
        
        def destroy
          requires :id
          
          options = {
            'id' => id,
          }

          service.delete_hagroup( options )
          true
        end

      end

    end
  end
end
