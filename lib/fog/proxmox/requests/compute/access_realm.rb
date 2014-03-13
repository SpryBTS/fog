module Fog
  module Compute
    class Proxmox
      class Real

        def access_role(options={})
          %w[ roleid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "access/roles/#{options['roleid']}" )
          %w[ roleid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def access_role(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
