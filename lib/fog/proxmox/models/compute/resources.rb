require 'fog/core/collection'
require 'fog/proxmox/models/compute/resource'

module Fog
  module Compute
    class Proxmox

      class Resources < Fog::Collection

        model Fog::Compute::Proxmox::Resource

        def all( filters = {} )
          load( service.cluster_request( { :command => 'resources', :filters => filters } ) )
        end

        def get( id )
          self.all( :id => id ).first
        rescue Fog::Errors::NotFound
            nil
        end
      
      end

    end
  end
end
