module Fog
  module Compute
    class Proxmox
      class Real

        def reset_server(options={})
          options.merge!(
            :method => :post,
            :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + options['vmid'] + '/status/reset',
          )
          options.delete( 'node' )
          options.delete( 'type' )
          options.delete( 'vmid' )
          request(options)
        end

      end
      
      class Mock
        def reset_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
