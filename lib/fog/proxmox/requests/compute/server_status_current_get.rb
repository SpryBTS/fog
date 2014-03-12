module Fog
  module Compute
    class Proxmox
      class Real

        def server_status_current_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/status/current",
          )
          %w[node type vmid].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def server_status_current_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
