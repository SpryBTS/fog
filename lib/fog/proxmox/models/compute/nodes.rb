require 'fog/core/collection'
require 'fog/proxmox/models/compute/node'

module Fog
  module Compute
    class Proxmox

      class Nodes < Fog::Collection

        model Fog::Compute::Proxmox::Node

        def all( options = {} )
          load service.call_nodes( options )
        end

        def get(nodeid)
          node = service.call_node( 'node' => nodeid ).first
          if node
            anode = new node
            return anode
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
