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
            options.merge! ( {'id' => id} )
            service.update_hagroup( options )
          else
            options.merge! ( {'vmid' => vmid} )
            service.create_hagroup( options )
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
