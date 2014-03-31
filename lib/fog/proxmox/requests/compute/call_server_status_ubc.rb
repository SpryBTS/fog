module Fog
  module Compute
    class Proxmox
      class Real

        def call_server_status_ubc(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/status/ubc" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_server_status_ubc(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
