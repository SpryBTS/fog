module Fog
  module Compute
    class Proxmox
      class Real

        def server_vncproxy_post(options={})
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/vncproxy",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_vncproxy_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
