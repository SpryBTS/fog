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

      end

    end
  end
end
