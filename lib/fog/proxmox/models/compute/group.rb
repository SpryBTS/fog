require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Group < Fog::Model

        identity  :groupid

        attribute :comment
        attribute :members

        def save
          requires :groupid

          options = {
            'groupid'     => groupid,
            'comment'     => comment,
          }

          service.create_group( options )
        end
        
        def delete
          requires :groupid
          
          options = {
            'groupid'     => groupid,
          }

          service.delete_group( options )
        end
        
      end

    end
  end
end
