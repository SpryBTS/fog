module Fog
  module Compute
    class Proxmox
      class Real

        def pools_pool_put(options={})
          options.merge!(
            :method => :put,
            :command => "pools/#{options['poolid']}",
          )
          options.delete( 'poolid' )
          request(options)
        end

      end
      
      class Mock
        def pools_pool_put(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
