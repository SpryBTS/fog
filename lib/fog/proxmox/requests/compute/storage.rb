module Fog
  module Compute
    class Proxmox
      class Real

        def storage(options={})
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
