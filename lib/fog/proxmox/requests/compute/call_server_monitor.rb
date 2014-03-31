module Fog
  module Compute
    class Proxmox
      class Real

        def call_server_monitor(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/monitor" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_server_monitor(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
