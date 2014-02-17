require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Role < Fog::Model

        identity  :roleid

        attribute :privs

      end

    end
  end
end
