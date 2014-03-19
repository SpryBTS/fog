module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_subscription(options={})
          options.merge!( :command => "nodes/#{options['node']}/subscription" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def nodes_node_subscription(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
