module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_version(options={})
          options.merge!( :command => "nodes/#{options['node']}/version" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def nodes_node_version(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
