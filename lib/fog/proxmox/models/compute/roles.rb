require 'fog/core/collection'
require 'fog/proxmox/models/compute/role'

module Fog
  module Compute
    class Proxmox

      class Roles < Fog::Collection

        model Fog::Compute::Proxmox::Role

        def all( filters = {} )
          load( service.access_request( { :command => 'roles', :filters => filters } ) )
        end

        def get(roleid)
          self.all( :roleid => roleid ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
