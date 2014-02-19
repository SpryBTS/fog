require 'fog/core/collection'
require 'fog/proxmox/models/compute/node'

module Fog
  module Compute
    class Proxmox

      class Nodes < Fog::Collection

        model Fog::Compute::Proxmox::Node

        def all( filters = {} )
          load( service.nodes_request( :filters => filters ) )
        end

        def get(node)
          self.all( :id => "#{'node/' + node unless node.nil?}" ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
