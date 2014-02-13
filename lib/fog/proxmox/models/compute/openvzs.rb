require 'fog/core/collection'
require 'fog/proxmox/models/compute/openvz'

module Fog
  module Compute
    class Proxmox

      class Openvzs < Fog::Collection

        model Fog::Compute::Proxmox::Openvz

        def all(filters = { 'type' => 'openvz' } )
          load service.cluster( 'resources', filters )
        end

        def get(id)
          
          openvz = service.cluster( 'resources', { :id => "openvz/#{id}" } )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
