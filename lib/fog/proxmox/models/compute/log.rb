require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Log < Fog::Model

        identity  :uid
        
        attribute :msg
        attribute :time
        attribute :node
        attribute :pid
        attribute :user
        attribute :pri
        attribute :tag

      end

    end
  end
end
