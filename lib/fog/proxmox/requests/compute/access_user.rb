module Fog
  module Compute
    class Proxmox
      class Real

        def access_user(options={})
          %w[ userid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "access/domains/#{options['userid']}" )
          %w[ userid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def access_user(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
