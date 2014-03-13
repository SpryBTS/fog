module Fog
  module Compute
    class Proxmox
      class Real

        def access_roles(options={})
          %w[ roleid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :post          
          command = "access/roles"
          if ( options.include?(:roleid) )
            command = command + '/' + options[:roleid]
            options.delete(:roleid)
          end
          options.merge!( :command => command )
          request(options)
        end

      end
      
      class Mock
        def access_roles(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
