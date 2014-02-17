require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Hagroup < Fog::Model

        identity  :id

        attribute :autostart
        attribute :text
        attribute :vmid

      end

    end
  end
end
