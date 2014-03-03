require 'fog/core/collection'
require 'fog/proxmox/models/compute/log'

module Fog
  module Compute
    class Proxmox

      class Logs < Fog::Collection

        model Fog::Compute::Proxmox::Log

        def all( options = {} )
          load service.list_logs( options )
        end

        def get(uid)
          log = service.list_logs( :filters => { :uid => uid } ).first
          if log
            alog = new log
            return alog
          end
        rescue Fog::Errors::NotFound
          nil
        end
      
      end

    end
  end
end
