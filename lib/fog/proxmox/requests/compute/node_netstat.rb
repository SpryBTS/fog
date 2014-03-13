module Fog
  module Compute
    class Proxmox
      class Real

        def node_netstat(options={})
          options.merge!( :command => "nodes/#{options['node']}/netstat" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_netstat(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
