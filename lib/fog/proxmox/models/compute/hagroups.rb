require 'fog/core/collection'
require 'fog/proxmox/models/compute/hagroup'

module Fog
  module Compute
    class Proxmox

      class Hagroups < Fog::Collection

        model Fog::Compute::Proxmox::Hagroup

        def all( filters = {} )
          load( service.cluster_request( { :command => 'ha/groups', :filters => filters } ) )
        end

        def get(id)
          hagroup = service.access_request( :command => "ha/groups#{'/' + id unless id.nil?}" )
          new hagroup.first if hagroup
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
