module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_ubcfailcnt(options={})
          options.merge!( :command => "nodes/#{options['node']}/ubcfailcnt" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_ubcfailcnt(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
