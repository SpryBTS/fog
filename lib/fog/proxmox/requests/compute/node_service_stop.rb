module Fog
  module Compute
    class Proxmox
      class Real

        def node_service_stop(options={})
          options.merge!( :command => "nodes/#{options['node']}/services/#{options['service']}/stop" )
          %w[ node service ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_service_stop(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
