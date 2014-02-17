require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Acl < Fog::Model

        identity  :ugid

        attribute :path
        attribute :propagate
        attribute :roleid
        attribute :type

      end

    end
  end
end
