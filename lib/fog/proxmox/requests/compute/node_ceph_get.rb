module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/ceph"
          )
          request(options)
        end

      end
      
      class Mock
        def node_ceph_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
