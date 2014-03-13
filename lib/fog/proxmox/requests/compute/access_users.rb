module Fog
  module Compute
    class Proxmox
      class Real

        def access_users(options={})
          %w[ userid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :post          
          command = "access/users"
          if ( options.include?(:userid) )
            command = command + '/' + options[:userid]
            options.delete(:userid)
          end
          options.merge!( :command => command )
          request(options)
        end

      end
      
      class Mock
        def access_users(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
