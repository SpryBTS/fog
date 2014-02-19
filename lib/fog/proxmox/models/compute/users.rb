require 'fog/core/collection'
require 'fog/proxmox/models/compute/user'

module Fog
  module Compute
    class Proxmox

      class Users < Fog::Collection

        model Fog::Compute::Proxmox::User

        def all( filters = {} )
          load( service.access_request( { :command => 'users', :filters => filters } ) )
        end

        def get(userid)
          
          self.all( :userid => userid ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
