require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class User < Fog::Model

        identity  :userid

        attribute :comment
        attribute :email
        attribute :enable
        attribute :expire
        attribute :firstname
        attribute :groups
        attribute :lastname
        attribute :password

        attr_accessor :loaded, :append

        def initialise
          self.loaded = false
          super
        end
        
        def save
          requires :userid

          options = {
            'userid'     => userid,
            'append'     => append,
            'comment'    => comment,
            'email'      => email,
            'enable'     => enable,
            'expire'     => expire,
            'firstname'  => firstname,
            'groups'     => groups,
            'lastname'   => lastname,
            'password'   => password,
          }

          if self.loaded then
            service.update_user( options )
          else
            service.create_user( options )
          end
          true
        end
        
        def destroy
          requires :userid
          
          options = {
            'userid'     => userid,
          }

          service.delete_role( options )
          true
        end
        
      end

    end
  end
end
