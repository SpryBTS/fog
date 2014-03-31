module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_syslog(options={})
          options.merge!( :command => "nodes/#{options['node']}/syslog" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_syslog(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
