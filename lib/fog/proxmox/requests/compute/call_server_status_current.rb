module Fog
  module Compute
    class Proxmox
      class Real

        def call_server_status_current(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/status/current" )
          %w[node type vmid].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def call_server_status_current(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
