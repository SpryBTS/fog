module Fog
  module Compute
    class Proxmox
      class Real

        def node_apt_versions_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/apt/versions"
          )
          request(options)
        end

      end
      
      class Mock
        def node_apt_versions_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
