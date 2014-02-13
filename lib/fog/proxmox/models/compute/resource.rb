require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Resource < Fog::Model

        identity  :id
        attribute :type
        attribute :node

      end

    end
  end
end
