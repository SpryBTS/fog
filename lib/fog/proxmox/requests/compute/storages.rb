module Fog
  module Compute
    class Proxmox
      class Real

        def storages(options={})
          %w[ storage type ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :post
          options.merge!( :command => "storage" )
          request(options)
        end

      end
      
      class Mock
        def storages(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
