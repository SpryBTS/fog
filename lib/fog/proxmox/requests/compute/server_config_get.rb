module Fog
  module Compute
    class Proxmox
      class Real

        def get_server_config(options={})

          options.merge!(
            :method => :get,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/config/",
          )
          %w[node type vmid].each { |s| options.delete( s ) }

          request(options)
        end

      end
      
      class Mock
        def get_server_config(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
