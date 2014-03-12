module Fog
  module Compute
    class Proxmox
      class Real

        def unlink_server(options={})
          options.merge!(
            :method => :put,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/unlink",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def unlink_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
