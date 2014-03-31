module Fog
  module Compute
    class Proxmox
      class Real

        def call_server_vncproxy(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/vncproxy" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_server_vncproxy(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
