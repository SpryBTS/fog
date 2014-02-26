require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Acl < Fog::Model

        identity  :ugid

        attribute :path
        attribute :propagate
        attribute :roleid
        attribute :type

        attr_accessor :groups, :users
        
        def save
          update( service.create_acl )
        end

        def destroy
          update( service.delete_acl )
        end
        
        def update( &func )
          requires :path
          requires :roleid

          data = {
            'path'      => self.path,
            'roles'     => self.roleid,
          }
          
          data['propagate'] = self.propagate unless self.propagate.nil?
          data['groups'] = self.groups unless self.groups.nil?
          data['users'] = self.users unless self.users.nil?
          
          func
        end
        
      end

    end
  end
end
