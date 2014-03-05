module Fog
  module Compute
    class Proxmox
      class Real

        def migrate_server(options={})
          options.merge!(
            :method => :post,
            :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + "#{options['vmid']}" + '/migrate',
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def migrate_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
