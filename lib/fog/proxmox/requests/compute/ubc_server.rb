module Fog
  module Compute
    class Proxmox
      class Real

        def ubc_server(options={})
          options.merge!(
            :method => :get,
            :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + options['vmid'] + '/status/ubc',
          )
          options.delete( 'node' )
          options.delete( 'type' )
          options.delete( 'vmid' )
          request(options)
        end

      end
      
      class Mock
        def ubc_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
