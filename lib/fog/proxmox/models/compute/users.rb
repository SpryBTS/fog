require 'fog/core/collection'
require 'fog/proxmox/models/compute/user'

module Fog
  module Compute
    class Proxmox

      class Users < Fog::Collection

        model Fog::Compute::Proxmox::User

        def create( attributes )
          model = self.new(attributes)
          model.save
        end
        
        def all( filters = {} )
          load service.list_users( :filters => filters )
        end

        def get(userid)
          user = service.list_users( :userid => userid )
          if user
            auser = new user
            auser.userid = userid
            auser.loaded = true
            return auser
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
