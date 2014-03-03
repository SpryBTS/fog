require 'fog/core/collection'
require 'fog/proxmox/models/compute/task'

module Fog
  module Compute
    class Proxmox

      class Tasks < Fog::Collection

        model Fog::Compute::Proxmox::Task

        def all( options = {} )
          load service.list_tasks( options )
        end

        def get(upid)
          task = service.list_tasks( :filters => { :upid => upid } ).first
          if task
            atask = new task
            return atask
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
