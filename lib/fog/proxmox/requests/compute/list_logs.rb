module Fog
  module Compute
    class Proxmox
      class Real

        def list_logs(options={})
          command = "cluster/log"
            
          options.merge!(
            :command => command
          )

          request(options)
        end

      end
      
      class Mock
        def list_logs(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
