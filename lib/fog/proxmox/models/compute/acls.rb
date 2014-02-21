require 'fog/core/collection'
require 'fog/proxmox/models/compute/acl'

module Fog
  module Compute
    class Proxmox

      class Acls < Fog::Collection

        model Fog::Compute::Proxmox::Acl

        def all( filters = {} )
#          load( service.access_request( { :command => 'acl', :filters => filters } ) )
          load service.list_acls( :filters => filters )
        end

        def get(ugid)
          self.all( :ugid => ugid ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
