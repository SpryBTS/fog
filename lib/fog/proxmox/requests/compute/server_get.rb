module Fog
  module Compute
    class Proxmox
      class Real

        def server_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/config/status",
          )
          %w[node type vmid].each { |s| options.delete( s ) }

          request(options)
        end

      end
      
      class Mock
        def server_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
