require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Pool < Fog::Model

        identity  :poolid
        
        attribute :comment
        attribute :members

      end

    end
  end
end
