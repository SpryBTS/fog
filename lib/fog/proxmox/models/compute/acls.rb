require 'fog/core/collection'
require 'fog/proxmox/models/compute/acl'

module Fog
  module Compute
    class Proxmox

      class Acls < Fog::Collection

        model Fog::Compute::Proxmox::Acl

        def all
          load service.access( 'acl' )
        end

        def get(ugid)
          
          pool = service.access( 'acl', { 'ugid' => ugid } )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
