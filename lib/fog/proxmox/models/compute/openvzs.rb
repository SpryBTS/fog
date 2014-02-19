require 'fog/core/collection'
require 'fog/proxmox/models/compute/openvz'

module Fog
  module Compute
    class Proxmox

      class Openvzs < Fog::Collection

        model Fog::Compute::Proxmox::Openvz

        def all( filters = { } )
          filters[:type] = 'openvz'
          load( service.cluster_request( { :command => 'resources', :filters => filters } ) )
        end

        def get(id)
          self.all( :id => "openvz/#{id}" ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
