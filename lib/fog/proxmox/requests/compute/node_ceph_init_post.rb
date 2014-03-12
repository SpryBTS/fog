module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_init_post(options={})
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/ceph/init"
          )
          request(options)
        end

      end
      
      class Mock
        def node_ceph_init_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
