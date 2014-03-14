module Fog
  module Compute
    class Proxmox
      class Real

        def node_service_start(options={})
          %w[ node service ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/services/#{options['service']}/start" )
          %w[ node service ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_service_start(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
