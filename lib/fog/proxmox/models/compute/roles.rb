require 'fog/core/collection'
require 'fog/proxmox/models/compute/role'

module Fog
  module Compute
    class Proxmox

      class Roles < Fog::Collection

        model Fog::Compute::Proxmox::Role

        def create( attributes )
          model = self.new(attributes)
          model.save
        end
        
        def all( filters = {} )
          load service.list_roles( :filters => filters )
        end

        def get(roleid)
          role = service.list_roles( :roleid => roleid )
          if role
            arole = new role
            arole.roleid = roleid
            arole.loaded = true
            return arole
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
