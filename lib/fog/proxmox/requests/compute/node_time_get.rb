module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_time_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/time"
          )
          request(options)
        end

      end
      
      class Mock
        def nodes_node_time_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
