module Fog
  module Compute
    class Proxmox
      class Real

        def clone_server(options={})
          options.merge!(
            :method => :post,
            :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + options['vmid'] + '/clone',
          )
          options.delete( 'node' )
          options.delete( 'type' )
          options.delete( 'vmid' )
          request(options)
        end

      end
      
      class Mock
        def clone_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
