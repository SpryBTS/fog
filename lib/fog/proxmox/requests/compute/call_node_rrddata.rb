module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_rrddata(options={})
          options.merge!( :command => "nodes/#{options['node']}/rrddata" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_rrddata(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
