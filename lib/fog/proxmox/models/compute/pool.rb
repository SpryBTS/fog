require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Pool < Fog::Model

        identity  :poolid
        
        attribute :comment
        attribute :members

        attr_accessor :loaded, :delete, :storage, :vms

        def initialise
          self.loaded = false
          super
        end
        
        def save
          requires :poolid

          options = {
            'poolid'  => poolid,
            'comment' => comment,
            'delete'  => delete,
            'storage' => storage,
            'vms'     => vms,
          }

          if self.loaded then
            service.update_pool( options )
          else
            service.create_pool( options )
          end
          true
        end
        
        def destroy
          requires :poolid
          
          options = {
            'poolid'     => poolid,
          }

          service.delete_pool( options )
          true
        end
        
      end

    end
  end
end
