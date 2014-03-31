module Fog
  module Compute
    class Proxmox
      class Real

        def call_storage(options={})
          options.merge!( :command => "storage/#{options['storage']}" )
          %w[ storage ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_storage(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
