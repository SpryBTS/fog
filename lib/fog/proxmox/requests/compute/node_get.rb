module Fog
  module Compute
    class Proxmox
      class Real

        def node_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}"
          )
          request(options)
        end

      end
      
      class Mock
        def node_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
