module Fog
  module Compute
    class Proxmox
      class Real

        def pool(options={})
          %w[ poolid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "pools/#{options['poolid']}" )
          options.delete( 'poolid' )
          request(options)
        end

      end
      
      class Mock
        def pool(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
