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
          pool = service.pools_request( :command => "pools#{'/' + poolid unless poolid.nil?}" )
          new pool.first if pool
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
