module Fog
  module Compute
    class Proxmox
      class Real

        def call_server_snapshot_config(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/snapshot/#{options['snapname']}/config" )
          %w[ node type vmid snapname ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_server_snapshot_config(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
