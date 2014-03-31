module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_service_state(options={})
          options.merge!( :command => "nodes/#{options['node']}/services/#{options['service']}/state" )
          %w[ node service ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_service_state(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
