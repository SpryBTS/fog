module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_mon(options={})
          options.merge!( :command => "nodes/#{options['node']}/ceph/mon/#{options['monid']}" )
          %w[ node monid ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_mon(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
