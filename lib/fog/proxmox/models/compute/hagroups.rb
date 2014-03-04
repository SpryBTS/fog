require 'fog/core/collection'
require 'fog/proxmox/models/compute/hagroup'

module Fog
  module Compute
    class Proxmox

      class Hagroups < Fog::Collection

        model Fog::Compute::Proxmox::Hagroup

        def create( attributes )
          model = self.new(attributes)
          model.save
        end
        
        def all( options = {} )
          load service.list_hagroups( options )
        end

        def get( id )
          hagroup = service.list_hagroups( :id => id )
          new (hagroup)
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
