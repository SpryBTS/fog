require 'fog/core/collection'
require 'fog/proxmox/models/compute/group'

module Fog
  module Compute
    class Proxmox

      class Groups < Fog::Collection

        model Fog::Compute::Proxmox::Group
        
        def create( attributes )
          model = self.new(attributes)
          model.save
        end
        
        def all( filters = {} )
          load service.call_access_groups( :filters => filters )
        end

        def get( groupid )
          group = service.call_access_group( 'groupid' => groupid )
          if group
            agroup = new( group )
            agroup.groupid = groupid
            agroup.loaded = true
            return agroup
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
