module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_scan(options={})
          options.merge!( :command => "nodes/#{options['node']}/scan" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_scan(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
