module Fog
  module Compute
    class Proxmox
      class Real

        def server(options={})
          command = "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}"
          command = command + '/config/status' if options[:method] = :get

          options.merge!( :command => command )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
