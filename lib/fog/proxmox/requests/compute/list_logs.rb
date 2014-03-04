module Fog
  module Compute
    class Proxmox
      class Real

        def list_logs(options={})

          options.merge!(
            :command => "cluster/log"
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
