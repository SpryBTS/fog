require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class User < Fog::Model

        identity  :userid

        attribute :enable
        attribute :expire
        attribute :groups

      end

    end
  end
end
