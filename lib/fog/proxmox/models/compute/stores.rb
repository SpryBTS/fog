require 'fog/core/collection'
require 'fog/proxmox/models/compute/store'

module Fog
  module Compute
    class Proxmox

      class Stores < Fog::Collection

        model Fog::Compute::Proxmox::Store

        def all
          load service.storage
        end

        def get(storage)
          
          store = service.storage( storage )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
