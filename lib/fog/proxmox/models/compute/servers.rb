require 'fog/core/collection'
require 'fog/proxmox/models/compute/server'

module Fog
  module Compute
    class Proxmox

      class Servers < Fog::Collection

        model Fog::Compute::Proxmox::Server

        def all(options = {})
          load service.list_servers( options )
        end

        def get(vmid)
          service.list_servers( :vmid => vmid ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
