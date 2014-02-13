require 'fog/core/collection'
require 'fog/proxmox/models/compute/server'

module Fog
  module Compute
    class Proxmox

      class Servers < Fog::Collection

        model Fog::Compute::Proxmox::Server

        def all(filters = { 'type' => ['qemu', 'openvz'] })
          load service.cluster('resources', filters)
        end

        def get(id)
          
          if server = service.cluster('resources', { 'id' => id, 'type' => ['qemu', 'openvz'] })
            new server
          end
        rescue Fog::Errors::NotFound
            nil
        end
      
      end

    end
  end
end
