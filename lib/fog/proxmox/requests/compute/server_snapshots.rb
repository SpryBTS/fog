module Fog
  module Compute
    class Proxmox
      class Real

        def server_snapshots(options={})
          options.merge!( :command => "nodes/#{node}/#{type}/#{vmid}/snapshot" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_snapshots(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
