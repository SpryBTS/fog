module Fog
  module Compute
    class Proxmox
      class Real

        def delete_store(options={})
          options.merge!(
            :method => :delete,
            :command => 'storage/' + options['storage'],
          )
          options.delete( 'storage' )
          request(options)
        end

      end
      
      class Mock
        def delete_store(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
