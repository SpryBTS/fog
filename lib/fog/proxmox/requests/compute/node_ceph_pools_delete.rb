module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_pools_delete(options={})
          %w[ name ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :delete,
            :command => "nodes/#{options['node']}/ceph/pools/#{options['name']}"
          )
          request(options)
        end

      end
      
      class Mock
        def node_ceph_pools_delete(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
