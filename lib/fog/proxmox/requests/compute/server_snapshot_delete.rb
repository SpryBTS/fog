module Fog
  module Compute
    class Proxmox
      class Real

        def server_snapshot_delete(options={})
          %w[ snapname ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :delete,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/snapshot/#{options['snapname']}",
          )
          %w[ node type vmid snapname ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_snapshot_delete(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
