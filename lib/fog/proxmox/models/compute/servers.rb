require 'fog/core/collection'
require 'fog/proxmox/models/compute/server'

module Fog
  module Compute
    class Proxmox

      class Servers < Fog::Collection

        model Fog::Compute::Proxmox::Server

        def all(options = {})
          load service.list_servers( options )
        end

        def get(vmid)
          vm = service.list_servers( :vmid => vmid ).first
          if vm
            # Remove attributes that conflict
            %w[ disk netout maxdisk maxmem diskread template cpu netin diskwrite mem ].each { |a| vm.delete( a ) }
            new( vm ).config
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
