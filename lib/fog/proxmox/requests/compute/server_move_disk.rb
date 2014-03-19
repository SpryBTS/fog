module Fog
  module Compute
    class Proxmox
      class Real

        def server_move_disk(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/move_disk" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_move_disk(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
