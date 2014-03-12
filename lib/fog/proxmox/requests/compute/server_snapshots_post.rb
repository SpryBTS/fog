module Fog
  module Compute
    class Proxmox
      class Real

        def server_snapshots_post(options={})
          %w[ snapname ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :post,
            :command => "nodes/#{node}/#{type}/#{vmid}/snapshot",
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_snapshots_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
