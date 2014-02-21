require 'fog/core/collection'
require 'fog/proxmox/models/compute/qemu'

module Fog
  module Compute
    class Proxmox

      class Qemus < Fog::Collection

        model Fog::Compute::Proxmox::Qemu

        def all( filters = {} )
          filters[:type] = 'qemu'
          load(
            service.cluster_request( {
              :command => 'resources',
              :filters => filters
            } ).map!{ |r|
              r['id'].gsub!(/^\/?#{r['type']}\//,'')
              r
            }
          )
        end

        def get(id)
          # Lookup node for this resources
          node = service.cluster_request( {
            :command => 'resources',
            :filters => {
              :type => 'qemu',
              :id => "qemu/#{id}"
            }
          } ).first['node']
          # Now retrieve domain details
          config = service.nodes_request( :command => "#{node}/qemu/#{id}/config" ).first
          status = service.nodes_request( :command => "#{node}/qemu/#{id}/status/current" ).first
          new config.merge( status )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
