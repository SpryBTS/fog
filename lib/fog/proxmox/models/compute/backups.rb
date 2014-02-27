require 'fog/core/collection'
require 'fog/proxmox/models/compute/backup'

module Fog
  module Compute
    class Proxmox

      class Backups < Fog::Collection

        model Fog::Compute::Proxmox::Backup

        def create( attributes )
          model = self.new(attributes)
          model.save
        end
        
        def all( filters = {} )
          load service.list_backups( :filters => filters )
        end

        def get(id)
          backup = service.list_backups( :id => id )
          if backup
            abackup = new(backup)
            abackup.loaded = true
            return abackup
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
