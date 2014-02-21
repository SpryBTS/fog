require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Node < Fog::Model

        identity  :id

        attribute :type
        attribute :node
        attribute :maxdisk
        attribute :disk
        attribute :cpu
        attribute :level
        attribute :maxcpu
        attribute :mem
        attribute :uptime
        attribute :maxmem

      end

    end
  end
end
