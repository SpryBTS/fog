module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_status(options={})
          %w[ command ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :post
          options.merge!( :command => "nodes/#{options['node']}/status" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def nodes_node_status(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
