module Fog
  module Compute
    class Proxmox
      class Real

        def server_template(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/template" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_template(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
