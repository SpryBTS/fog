module Fog
  module Compute
    class Proxmox
      class Real

        def delete_server(options={})
          options.merge!(
            :method => :delete,
            :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + "#{options['vmid']}",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def delete_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
