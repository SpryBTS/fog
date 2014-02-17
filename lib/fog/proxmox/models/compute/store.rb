require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Store < Fog::Model

        identity  :storage
        
        attribute :base
        attribute :content
        attribute :export
        attribute :maxfiles
        attribute :options
        attribute :path
        attribute :portal
        attribute :server
        attribute :shared
        attribute :target
        attribute :type
        attribute :vgname

      end

    end
  end
end
