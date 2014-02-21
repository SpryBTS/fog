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
          requires :path
          requires :roleid

          data = {
            'path'      => self.path,
            'propagate' => self.propagate,
            'roles'     => self.roleid,
          }
          
          data['groups'] = self.groups unless self.groups.nil?
          data['users'] = self.users unless self.users.nil?

          result = service.create_acl data
            
        end

        def destroy
          requires :path
          requires :roleid

          data = {
            'path'      => self.path,
            'propagate' => self.propagate,
            'roles'     => self.roleid,
          }

          data['propagate'] = self.propagate unless self.propagate.nil?
          data['groups'] = self.groups unless self.groups.nil?
          data['users'] = self.users unless self.users.nil?

          result = service.delete_acl data

        end
        
      end

    end
  end
end
