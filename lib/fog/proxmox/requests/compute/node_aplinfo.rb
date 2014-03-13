module Fog
  module Compute
    class Proxmox
      class Real

        def node_aplinfo(options={})
          %w[ template storage ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :post
          options.merge!( :command => "nodes/#{options['node']}/aplinfo" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_aplinfo(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
