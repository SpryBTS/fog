module Fog
  module Compute
    class Proxmox
      class Real

        def snapshot_server(options={})
          options.merge!(
            :method => :post,
            :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + "#{options['vmid']}" + '/snapshot',
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

        def get_snapshots_server(options={})
          options.merge!(
            :method => :get,
            :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + "#{options['vmid']}" + '/snapshot',
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def snapshot_server(options={})
          Fog::Mock.not_implemented
        end
        def get_snapshots_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
