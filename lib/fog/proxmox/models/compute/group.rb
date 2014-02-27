require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Group < Fog::Model

        identity  :groupid

        attribute :comment
        attribute :members

        attr_accessor :loaded

        def initialise
          self.loaded = false
          super
        end
        
        def save
          requires :groupid

          options = {
            'groupid'     => groupid,
            'comment'     => comment,
          }

          if self.loaded then
            service.update_group( options )
          else
            service.create_group( options )
          end
          true
        end
        
        def destroy
          requires :groupid
          
          options = {
            'groupid'     => groupid,
          }

          service.delete_group( options )
          true
        end
        
      end

    end
  end
end
