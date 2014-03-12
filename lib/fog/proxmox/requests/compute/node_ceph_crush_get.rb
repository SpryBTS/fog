module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_crush_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/ceph/crush"
          )
          request(options)
        end

      end
      
      class Mock
        def node_ceph_crush_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
