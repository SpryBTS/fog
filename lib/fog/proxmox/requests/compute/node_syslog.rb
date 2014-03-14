module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_syslog(options={})
          %w[ node ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/syslog" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def nodes_node_syslog(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
