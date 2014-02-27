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
          load service.list_groups( :filters => filters )
        end

        def get(groupid)
          group = service.list_groups( :groupid => groupid )
          if group
            agroup = new(group)
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
