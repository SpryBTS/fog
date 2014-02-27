require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Realm < Fog::Model

        identity  :realm

        attribute :base_dn
        attribute :comment
        attribute :default
        attribute :delete
        attribute :digest
        attribute :domain
        attribute :plugin
        attribute :port
        attribute :secure
        attribute :type
        attribute :user_attr

        attr_accessor :loaded

        def initialise
          self.loaded = false
          super
        end
        
        def save
          requires :realm
          requires :type unless self.loaded

          options = {
            'realm' => realm,
            'base_dn' => base_dn,
            'comment' => comment,
            'default' => default,
            'digest' => digest,
            'domain' => domain,
            'port' => port,
            'secure' => secure,
            'user_attr' => user_attr,
          }

          if self.loaded then
            service.update_realm( options )
          else
            options['type'] = type 
            service.create_realm( options )
          end
          true
        end
        
        def destroy
          requires :realm
          
          options = {
            'realm' => realm,
          }

          service.delete_realm( options )
          true
        end
        

      end

    end
  end
end
