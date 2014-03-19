module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_osds(options={})
          command = "nodes/#{options['node']}/ceph/osd"
          options.merge!( :command => command )
          %w[ node dev ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_osds(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
