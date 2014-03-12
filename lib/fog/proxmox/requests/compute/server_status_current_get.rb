module Fog
  module Compute
    class Proxmox
      class Real

        def get_server_stats(options={})

          options.merge!(
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/status/current",
          )
          %w[node type vmid].each { |s| options.delete( s ) }

          request(options)
        end

      end
      
      class Mock
        def get_server_stats(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
