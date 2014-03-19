module Fog
  module Compute
    class Proxmox
      class Real

        def node_services(options={})
          options.merge!( :command => "nodes/#{options['node']}/services" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_services(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
