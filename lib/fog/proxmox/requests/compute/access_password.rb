module Fog
  module Compute
    class Proxmox
      class Real

        def access_acl(options={})
          %w[ path roles ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :put
          options.merge!( :command => 'access/acl' )
          request(options)
        end

      end
      
      class Mock
        def access_acl(options={})
          Fog::Mock.not_implemented
        end
      end
        
    end
  end
end
