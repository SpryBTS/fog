require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Node < Fog::Model

        identity  :id
        attribute :type
        attribute :node
        attribute :status

      end

    end
  end
end
