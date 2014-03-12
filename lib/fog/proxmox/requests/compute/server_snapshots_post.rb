module Fog
  module Compute
    class Proxmox
      class Real

        def snapshot_server(options={})
          raise Fog::Compute::Proxmox::BadRequest.new('API command missing parameter node') unless node = options['node']
          raise Fog::Compute::Proxmox::BadRequest.new('API command missing parameter type') unless type = options['type']
          raise Fog::Compute::Proxmox::BadRequest.new('API command missing parameter vmid') unless vmid = options['vmid']
          options.merge!(
            :method => :post,
            :command => "nodes/#{node}/#{type}/#{vmid}/snapshot",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def get_snapshot_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
