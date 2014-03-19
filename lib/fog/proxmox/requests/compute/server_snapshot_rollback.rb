module Fog
  module Compute
    class Proxmox
      class Real

        def server_snapshot_rollback(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/snapshot/#{options['snapname']}/rollback" )
          %w[ node type vmid snapname ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_snapshot_rollback(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
