require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Role < Fog::Model

        identity  :roleid

        attribute :privs

        attr_accessor :loaded, :append

        def initialise
          self.loaded = false
          super
        end
        
        def save
          requires :roleid
          requires :privs if self.loaded

          options = {
            'roleid' => roleid,
            'append' => append,
            'privs'  => privs,
          }

          if self.loaded then
            service.call_update_role( options )
          else
            service.call_create_role( options )
          end
          true
        end
        
        def destroy
          requires :roleid
          options = {
              'roleid' => roleid
          }
          service.call_delete_role( options )
          true
        end

      end

    end
  end
end
