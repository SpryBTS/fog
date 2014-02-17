require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Backup < Fog::Model

        identity  :id

        attribute :compress
        attribute :dow
        attribute :mailto
        attribute :mode
        attribute :node
        attribute :quiet
        attribute :starttime
        attribute :storage
        attribute :smlab_nfs
        attribute :vmid

      end

    end
    
  end
end
