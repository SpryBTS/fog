module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_osd_post(options={})
          %w[ dev ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/ceph/osd"
          )
          request(options)
        end

      end
      
      class Mock
        def node_ceph_osd_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
