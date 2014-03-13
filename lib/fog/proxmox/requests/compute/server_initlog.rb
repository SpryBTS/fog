module Fog
  module Compute
    class Proxmox
      class Real

        def server_initlog(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/initlog" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_initlog(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
