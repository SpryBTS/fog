require 'fog/core/collection'
require 'fog/proxmox/models/compute/backup'

module Fog
  module Compute
    class Proxmox

      class Backups < Fog::Collection

        model Fog::Compute::Proxmox::Backup

        def all( filters = {} )
          load( service.cluster_request( { :command => 'backup', :filters => filters } ) )
        end

        def get(id)
          backup = service.access_request( :command => "backup#{'/' + id unless id.nil?}" )
          new backup.first if backup
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
