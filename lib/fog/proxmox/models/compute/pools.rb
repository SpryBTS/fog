require 'fog/core/collection'
require 'fog/proxmox/models/compute/pool'

module Fog
  module Compute
    class Proxmox

      class Pools < Fog::Collection

        model Fog::Compute::Proxmox::Pool

        def all( filters = {} )
          load( service.pools_request( :filters => filters ) )
        end

        def get(poolid)
          if pool = service.pools_request( :command => poolid )
            pool['poolid'] = poolid
            new (pool)
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
