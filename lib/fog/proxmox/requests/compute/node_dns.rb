module Fog
  module Compute
    class Proxmox
      class Real

        def node_dns(options={})
          %w[ node search ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
            } if options[:method] == :post
          options.merge!( :command => "nodes/#{options['node']}/dns" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_dns(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
