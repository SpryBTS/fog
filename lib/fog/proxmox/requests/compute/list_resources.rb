module Fog
  module Compute
    class Proxmox
      class Real

        def list_resources(options={})
            
          options.merge!(
            :command => "cluster/resources"
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
