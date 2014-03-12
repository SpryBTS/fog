module Fog
  module Compute
    class Proxmox
      class Real

        def server_status_reset_post(options={})
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/status/reset",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_status_reset_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
