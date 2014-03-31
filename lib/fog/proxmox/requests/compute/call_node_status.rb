module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_status(options={})
          options.merge!( :command => "nodes/#{options['node']}/status" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_status(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
