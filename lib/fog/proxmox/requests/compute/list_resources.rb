module Fog
  module Compute
    class Proxmox
      class Real

        def list_resources(options={})
          command = "cluster/resources"
            
          options.merge!(
            :command => command
          )

          request(options)
        end

      end
      
      class Mock
        def list_resources(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
