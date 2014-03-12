module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_mon_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/ceph/mon"
          )
          request(options)
        end

      end
      
      class Mock
        def node_ceph_mon_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
