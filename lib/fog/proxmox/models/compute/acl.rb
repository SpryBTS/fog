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

        def save
          self.action( false )
        end

        def destroy
          self.action( true )
        end
        
        def action( delete = false )
          requires :path, :roleid
          data = {
            'delete'    => delete,
            'path'      => attributes[:path],
            'propogate' => attributes[:propagate],
            attributes[:type] => attributes[:roleid]
          }
          result = service.access_post(
            :command => 'acl',
            :body => Fog::JSON.encode(data)
          )
        end

      end

    end
  end
end
