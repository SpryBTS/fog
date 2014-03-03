module Fog
  module Compute
    class Proxmox
      class Real

        def list_nodes(options={})
          command = "nodes"
            
          options.merge!(
            :command => command
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
