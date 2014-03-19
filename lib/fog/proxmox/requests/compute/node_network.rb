module Fog
  module Compute
    class Proxmox
      class Real

        def node_network_delete(options={})
          options.merge!( :command => "nodes/#{options['node']}/network/#{options['iface']}" )
          %w[ node iface ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_network_delete(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
