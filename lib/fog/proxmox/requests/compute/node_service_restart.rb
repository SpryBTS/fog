module Fog
  module Compute
    class Proxmox
      class Real

        def node_service_restart(options={})
          options.merge!( :command => "nodes/#{options['node']}/services/#{options['service']}/restart" )
          %w[ node service ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_service_restart(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
