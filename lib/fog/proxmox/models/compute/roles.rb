require 'fog/core/collection'
require 'fog/proxmox/models/compute/role'

module Fog
  module Compute
    class Proxmox

      class Roles < Fog::Collection

        model Fog::Compute::Proxmox::Role

        def all
          load service.access( 'roles' )
        end

        def get(roleid)
          
          pool = service.access( 'roles', { 'roleid' => roleid } )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
