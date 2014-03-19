module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_osd(options={})
          options.merge!( :command => "nodes/#{options['node']}/ceph/osd/#{options['osdid']}" )
          %w[ node osdid ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_osd(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
