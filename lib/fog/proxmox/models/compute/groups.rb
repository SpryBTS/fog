require 'fog/core/collection'
require 'fog/proxmox/models/compute/group'

module Fog
  module Compute
    class Proxmox

      class Groups < Fog::Collection

        model Fog::Compute::Proxmox::Group

        def all
          load service.access( 'groups' )
        end

        def get(groupid)
          
          pool = service.access( 'groups', { 'groupid' => groupid } )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
