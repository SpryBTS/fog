require 'fog/core/collection'
require 'fog/proxmox/models/compute/backup'

module Fog
  module Compute
    class Proxmox

      class Backups < Fog::Collection

        model Fog::Compute::Proxmox::Backup

        def all
          load service.cluster( 'backup' )
        end

        def get(id)
          
          pool = service.cluster( 'backup', { 'id' => id } )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
