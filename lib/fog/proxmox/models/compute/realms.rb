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
          load service.list_realms( :filters => filters )
        end

        def get(realmid)
          realm = service.list_realms( :realm => realmid )
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
