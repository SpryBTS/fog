require 'fog/core/collection'
require 'fog/proxmox/models/compute/server'

module Fog
  module Compute
    class Proxmox

      class Servers < Fog::Collection

        model Fog::Compute::Proxmox::Server

        def all(filters = {})
          filters[:type] = ['qemu', 'openvz']
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
          self.all( :vmid => id ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
