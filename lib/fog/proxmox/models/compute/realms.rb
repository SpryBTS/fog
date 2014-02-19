require 'fog/core/collection'
require 'fog/proxmox/models/compute/realm'

module Fog
  module Compute
    class Proxmox

      class Realms < Fog::Collection

        model Fog::Compute::Proxmox::Realm

        def all( filters = {} )
          load( service.access_request( { :command => 'domains', :filters => filters } ) )
        end

        def get(realm)
          realm = service.access_request( :command => "domains#{'/' + realm unless realm.nil?}" )
          new realm.first if realm
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
