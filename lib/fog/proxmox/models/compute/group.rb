require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Group < Fog::Model

        identity  :groupid

        attribute :comment
        attribute :members

      end

    end
  end
end
