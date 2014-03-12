module Fog
  module Compute
    class Proxmox
      class Real

        def node_netstat_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/netstat"
          )
          request(options)
        end

      end
      
      class Mock
        def node_netstat_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
