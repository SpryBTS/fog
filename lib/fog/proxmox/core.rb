require 'fog/core'

module Fog
  module Proxmox
    
    extend Fog::Provider

    service(:compute, 'Compute')

  end
end

