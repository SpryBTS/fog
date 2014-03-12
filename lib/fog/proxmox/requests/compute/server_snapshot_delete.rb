module Fog
  module Compute
    class Proxmox
      class Real

        def get_snapshot_server(options={})
          options.merge!(
            :method => :get,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/snapshot",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def get_snapshot_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
