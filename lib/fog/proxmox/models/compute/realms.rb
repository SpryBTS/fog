require 'fog/core/collection'
require 'fog/proxmox/models/compute/realm'

module Fog
  module Compute
    class Proxmox

      class Realms < Fog::Collection

        model Fog::Compute::Proxmox::Realm

        def create( attributes )
          model = self.new(attributes)
          model.save
        end
        
        def all( filters = {} )
          load service.call_access_domains( :filters => filters )
        end

        def get(realmid)
          realm = service.call_access_domain( :realm => realmid )
          if realm
            arealm = new realm
            arealm.realm = realmid
            arealm.loaded = true
            return arealm
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
