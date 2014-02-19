require 'fog/core/collection'
require 'fog/proxmox/models/compute/log'

module Fog
  module Compute
    class Proxmox

      class Logs < Fog::Collection

        model Fog::Compute::Proxmox::Log

        def all( filters = {} )
          load( service.cluster_request( { :command => 'log', :filters => filters } ) )
        end

        def get( uid )
          self.all( :uid => uid ).first
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
