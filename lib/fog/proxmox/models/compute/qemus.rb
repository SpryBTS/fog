require 'fog/core/collection'
require 'fog/proxmox/models/compute/qemu'

module Fog
  module Compute
    class Proxmox

      class Qemus < Fog::Collection

        model Fog::Compute::Proxmox::Qemu

        def all( filters = { } )
          filters[:type] = 'qemu'
          load( service.cluster_request( { :command => 'resources', :filters => filters } ) )
        end

        def get(id)
          self.all( :id => "qemu/#{id}" ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
