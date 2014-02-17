require 'fog/core/collection'
require 'fog/proxmox/models/compute/qemu'

module Fog
  module Compute
    class Proxmox

      class Qemus < Fog::Collection

        model Fog::Compute::Proxmox::Qemu

        def all(filters = { 'type' => 'qemu' } )
          load service.cluster( 'resources', filters )
        end

        def get(id)
          
          openvz = service.cluster( 'resources', { :id => "qemu/#{id}" } )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
