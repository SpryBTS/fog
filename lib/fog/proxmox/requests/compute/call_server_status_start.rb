module Fog
  module Compute
    class Proxmox
      class Real

        def call_server_status_start(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{}options['type']/#{options['vmid']}/status/start" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_server_status_start(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
