module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_ceph(options={})
          options.merge!( :command => "nodes/#{options['node']}/ceph" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_ceph(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
