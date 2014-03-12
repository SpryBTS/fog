module Fog
  module Compute
    class Proxmox
      class Real

        def server_config_get(options={})
          options.merge!(
            :method => :get,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/config/",
          )
          %w[node type vmid].each { |s| options.delete( s ) }

          request(options)
        end

      end
      
      class Mock
        def server_config_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
