module Fog
  module Compute
    class Proxmox
      class Real

        def access_domains(options={})
          %w[ realm type ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :post          
          command = "access/domains"
          if ( options.include?(:realm) )
            command = command + '/' + options[:realm]
            options.delete(:realm)
          end
          options.merge!( :command => command )
          request(options)
        end

      end
      
      class Mock
        def access_domains(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
