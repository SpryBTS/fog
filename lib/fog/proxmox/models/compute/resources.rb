require 'fog/core/collection'
require 'fog/proxmox/models/compute/resource'

module Fog
  module Compute
    class Proxmox

      class Resources < Fog::Collection

        model Fog::Compute::Proxmox::Resource

        def all( options = {} )
          load service.list_resources( options )
        end

        def get( id )
          self.all( :filters => { :id => id } ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
