require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Realm < Fog::Model

        identity  :realm

        attribute :comment
        attribute :plugin
        attribute :type

      end

    end
  end
end
