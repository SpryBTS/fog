require 'fog/core/collection'
require 'fog/proxmox/models/compute/pool'

module Fog
  module Compute
    class Proxmox

      class Pools < Fog::Collection

        model Fog::Compute::Proxmox::Pool

        def all
          load service.pools
        end

        def get(poolid)
          
          pool = service.pools( poolid )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
