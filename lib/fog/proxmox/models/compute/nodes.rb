require 'fog/core/collection'
require 'fog/proxmox/models/compute/node'

module Fog
  module Compute
    class Proxmox

      class Nodes < Fog::Collection

        model Fog::Compute::Proxmox::Node

        def all
          load service.nodes
        end

        def get(node)
          
          pool = service.nodes( node )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
