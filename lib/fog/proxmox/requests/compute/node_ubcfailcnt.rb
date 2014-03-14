module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_ubcfailcnt(options={})
          %w[ node ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/ubcfailcnt" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def nodes_node_ubcfailcnt(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
