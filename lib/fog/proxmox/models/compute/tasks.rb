require 'fog/core/collection'
require 'fog/proxmox/models/compute/task'

module Fog
  module Compute
    class Proxmox

      class Tasks < Fog::Collection

        model Fog::Compute::Proxmox::Task

        def all( filters = {} )
          load( service.cluster_request( { :command => 'tasks', :filters => filters } ) )
        end

        def get( upid )
          
          self.all( :upid => upid ).first
        rescue Fog::Errors::NotFound
            nil
        end
      
      end

    end
  end
end
