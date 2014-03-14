module Fog
  module Compute
    class Proxmox
      class Real

        def storage(options={})
          %w[ storage ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "storage/#{options['storage']}" )
          %w[ storage ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def storage(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
