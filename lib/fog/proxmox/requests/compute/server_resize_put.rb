module Fog
  module Compute
    class Proxmox
      class Real

        def server_resize_put(options={})
          options.merge!(
            :method => :put,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/resize",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_resize_put(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
