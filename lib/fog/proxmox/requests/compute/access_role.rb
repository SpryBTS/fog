module Fog
  module Compute
    class Proxmox
      class Real

        def access_realm(options={})
          %w[ realm ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "access/domains/#{options['realm']}" )
          %w[ realm ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def access_realm(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
