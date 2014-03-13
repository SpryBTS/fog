module Fog
  module Compute
    class Proxmox
      class Real

        def pools(options={})
          %w[ poolid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :post
          options.merge!( :command => "pools" )
          request(options)
        end

      end
      
      class Mock
        def pools(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
