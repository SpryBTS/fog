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
            service.access_group( { :method => :put }.merge options )
          else
            service.access_groups( { :method => :post }.merge options )
          end
          true
        end
        
        def destroy
s          requires :groupid
          
          options = {
            'groupid' => groupid,
          }
          service.delete_group( { :method => :delete }.merge options )
          true
        end
        
      end

    end
  end
end
