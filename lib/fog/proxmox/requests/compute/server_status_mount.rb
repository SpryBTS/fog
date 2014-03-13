module Fog
  module Compute
    class Proxmox
      class Real

        def server_status_mount(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/status/mount" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_status_mount(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
