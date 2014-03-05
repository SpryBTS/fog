module Fog
  module Compute
    class Proxmox
      class Real

        def shutdown_server(options={})
          options.merge!(
            :method => :post,
            :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + "#{options['vmid']}" + '/status/shutdown',
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def shutdown_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
