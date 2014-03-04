module Fog
  module Compute
    class Proxmox
      class Real

        def list_tasks(options={})
            
          options.merge!(
            :command => "cluster/tasks"
          )

          request(options)
        end

      end
      
      class Mock
        def list_tasks(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
