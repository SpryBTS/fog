module Fog
  module Compute
    class Proxmox
      class Real

        def node_networks(options={})
          options.merge!( :command => "nodes/#{options['node']}/network" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_networks_delete(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
