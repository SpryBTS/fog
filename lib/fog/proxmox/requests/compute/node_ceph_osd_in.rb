module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_osd_in(options={})
          options.merge!( :command => "nodes/#{options['node']}/ceph/osd/#{options['osdid']}/in" )
          %w[ node osdid ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_osd_in(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
