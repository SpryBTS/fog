module Fog
  module Compute
    class Proxmox
      class Real

        def resize_server(options={})
          options.merge!(
            :method => :put,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/resize",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def resize_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
