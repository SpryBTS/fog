require 'fog/core/collection'
require 'fog/proxmox/models/compute/user'

module Fog
  module Compute
    class Proxmox

      class Users < Fog::Collection

        model Fog::Compute::Proxmox::User

        def all
          load service.access( 'users' )
        end

        def get(userid)
          
          pool = service.access( 'users', { 'userid' => userid } )
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
