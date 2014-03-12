module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_ubcfailcnt_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/ubcfailcnt"
          )
          request(options)
        end

      end
      
      class Mock
        def nodes_node_ubcfailcnt_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
