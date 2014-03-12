module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_osd_delete(options={})
          %w[ osdid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :delete,
            :command => "nodes/#{options['node']}/ceph/osd/#{options['osdid']}"
          )
          request(options)
        end

      end
      
      class Mock
        def node_ceph_osd_delete(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
