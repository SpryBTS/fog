module Fog
  module Compute
    class Proxmox
      class Real

        def server_unlink(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/unlink" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_unlink(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
