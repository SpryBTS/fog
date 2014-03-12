module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_vzdump_post(options={})
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/vzdump"
          )
          request(options)
        end

      end
      
      class Mock
        def nodes_node_vzdump_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
