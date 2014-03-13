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
            'groupid' => groupid,
            'comment' => comment,
          }

          if self.loaded then
            service.access_group( options.merge( :method => :put ) )
          else
            service.access_groups( options.merge( :method => :post ) )
          end
          true
        end
        
        def destroy
          requires :groupid
          
          options = {
            'groupid' => groupid,
          }
          service.delete_group( options.merge( :method => :delete ) )
          true
        end
        
      end

    end
  end
end
