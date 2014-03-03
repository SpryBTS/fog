require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Task < Fog::Model

        identity  :upid
        
        attribute :saved
        attribute :status
        attribute :node
        attribute :starttime
        attribute :endtime
        attribute :user
        attribute :id
        attribute :type

        attr_accessor :errors, :limit, :start, :userfilter, :vmid

        def destroy
          requires :node
          requires :upid
          
          options = {
            'upid' => upid,
            'node' => node
          }

          service.delete_task( options )
          true
        end

      end

    end
  end
end
