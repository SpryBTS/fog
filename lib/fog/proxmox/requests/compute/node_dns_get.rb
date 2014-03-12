module Fog
  module Compute
    class Proxmox
      class Real

        def node_dns_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/dns"
          )
          request(options)
        end

      end
      
      class Mock
        def node_dns_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
