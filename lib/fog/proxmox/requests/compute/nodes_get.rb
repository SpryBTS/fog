module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_get(options={})
          options.merge!(
            :command => "nodes"
          )
          request(options)
        end

      end
      
      class Mock
        def list_nodes(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
