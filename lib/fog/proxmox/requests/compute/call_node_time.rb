module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_time(options={})
          options.merge!( :command => "nodes/#{options['node']}/time" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_time(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
