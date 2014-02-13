require 'fog/core/collection'
require 'fog/proxmox/models/compute/resource'

module Fog
  module Compute
    class Proxmox

      class Resources < Fog::Collection

        model Fog::Compute::Proxmox::Resource

        def all( filters = {} )
          load service.cluster( 'resources', filters )
        end

        def get( id )
          
          resource = service.cluster( 'resources', { :id => id } )
        rescue Fog::Errors::NotFound
            nil
        end
      
      end

    end
  end
end
