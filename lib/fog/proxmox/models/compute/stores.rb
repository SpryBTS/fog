require 'fog/core/collection'
require 'fog/proxmox/models/compute/store'

module Fog
  module Compute
    class Proxmox

      class Stores < Fog::Collection

        model Fog::Compute::Proxmox::Store

        def all( options = {} )
          load service.list_stores( options )
        end

        def get(store)
          store = service.list_stores( :storage => store )
          if store
            astore = new(store)
            astore.loaded = true
            return astore
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
