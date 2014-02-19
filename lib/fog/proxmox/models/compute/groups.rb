require 'fog/core/collection'
require 'fog/proxmox/models/compute/group'

module Fog
  module Compute
    class Proxmox

      class Groups < Fog::Collection

        model Fog::Compute::Proxmox::Group

        def all( filters = {} )
          load( service.access_request( { :command => 'groups', :filters => filters } ) )
        end

        def get(groupid)
          group = service.access_request( :command => "groups#{'/' + groupid unless groupid.nil?}" )
          new group.first if group
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
