module Fog
  module Compute
    class Proxmox
      class Real

        def ubc_server(options={})
          options.merge!(
            :method => :get,
            :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + "#{options['vmid']}" + '/status/ubc',
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
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
