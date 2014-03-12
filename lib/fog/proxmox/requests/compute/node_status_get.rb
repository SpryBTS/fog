module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_status_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/status"
          )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def nodes_node_status_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
