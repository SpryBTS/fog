module Fog
  module Compute
    class Proxmox
      class Real

        def node_bootlog_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/bootlog"
          )
          request(options)
        end

      end
      
      class Mock
        def node_bootlog_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
