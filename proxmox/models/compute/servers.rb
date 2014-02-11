require 'fog/core/collection'
require 'fog/proxmox/models/compute/server'

module Fog
  module Compute
    class Proxmox

      class Servers < Fog::Collection

        model Fog::Compute::Proxmox::Server

        def all(filters = {})
          load service.cluster('resources', filters)
        end

        def get(node = nil, type = nil, id)
          filters={}
          filters[:node] => node if !node.nil?
          filters[:type] => type if !type.nil?
          
          service.cluster('resources', filters )

          if server = service.nodes_openvz(node, id)
            new server
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
