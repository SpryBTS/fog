require 'fog/core/collection'
require 'fog/proxmox/models/compute/pool'

module Fog
  module Compute
    class Proxmox

      class Pools < Fog::Collection

        model Fog::Compute::Proxmox::Pool

        def all( options = {} )
          load service.list_pools( options )
        end

        def get(poolid)
          pool = service.list_pools( :poolid => poolid )
          if pool
            apool = new(pool)
            apool.poolid = poolid
            apool.loaded = true
            return apool
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
