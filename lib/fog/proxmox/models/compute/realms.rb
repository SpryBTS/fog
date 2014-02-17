require 'fog/core/collection'
require 'fog/proxmox/models/compute/realm'

module Fog
  module Compute
    class Proxmox

      class Realms < Fog::Collection

        model Fog::Compute::Proxmox::Realm

        def all
          load service.access( 'domains' )
        end

        def get(realm)
          
          pool = service.access( 'domains', { 'realm' => realm } )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
