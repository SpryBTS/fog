module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_ceph_pool(options={})
          options.merge!( :command => "nodes/#{options['node']}/ceph/pools/#{options[:name]}" )
          %w[ node name ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_ceph_pool(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
