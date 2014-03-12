module Fog
  module Compute
    class Proxmox
      class Real

        def server_snapshot_config_get(options={})
          %w[ snapname ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :get,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/snapshot/#{options['snapname']}/config",
          )
          %w[ node type vmid snapname ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_snapshot_config_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
