module Fog
  module Compute
    class Proxmox
      class Real

        def node_apt_update_post(options={})
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/apt/update"
          )
          request(options)
        end

      end
      
      class Mock
        def node_apt_update_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
