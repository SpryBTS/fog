module Fog
  module Compute
    class Proxmox
      class Real

        def update_store(options={})
          options.merge!(
            :method => :put,
            :command => 'storage/' + options['storage'],
          )
          options.delete( 'storage' )
          request(options)
        end

      end
      
      class Mock
        def update_store(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
