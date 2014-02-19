require 'fog/core/collection'
require 'fog/proxmox/models/compute/store'

module Fog
  module Compute
    class Proxmox

      class Stores < Fog::Collection

        model Fog::Compute::Proxmox::Store

        def all( filters = {} )
          load( service.stores_request( filters ) )
        end

        def get(store)
          self.all( :storage => store ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
