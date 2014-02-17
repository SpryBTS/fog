require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Resource < Fog::Model

        identity  :id
        
        attribute :node
        attribute :status
        attribute :type

      end

    end
  end
end
