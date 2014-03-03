module Fog
  module Compute
    class Proxmox
      class Real

        def list_tasks(options={})
          command = "cluster/tasks"
            
          options.merge!(
            :command => command
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
