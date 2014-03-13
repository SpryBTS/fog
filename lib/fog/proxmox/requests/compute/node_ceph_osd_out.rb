module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_osd_out(options={})
          %w[ osdid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/ceph/osd/#{options['osdid']}/out" )
          %w[ node osdid ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_osd_out(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
