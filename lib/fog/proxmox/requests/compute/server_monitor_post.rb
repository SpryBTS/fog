module Fog
  module Compute
    class Proxmox
      class Real

        def monitor_server(options={})
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/monitor",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def monitor_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
