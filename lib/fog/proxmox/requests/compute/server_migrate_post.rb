module Fog
  module Compute
    class Proxmox
      class Real

        def server_migrate_post(options={})
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/migrate",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_migrate_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
