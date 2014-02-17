require 'fog/core/collection'
require 'fog/proxmox/models/compute/hagroup'

module Fog
  module Compute
    class Proxmox

      class Hagroups < Fog::Collection

        model Fog::Compute::Proxmox::Hagroup

        def all
          load service.cluster( 'ha/groups' )
        end

        def get(id)
          
          pool = service.cluster( 'ha/groups', { 'id' => id } )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
