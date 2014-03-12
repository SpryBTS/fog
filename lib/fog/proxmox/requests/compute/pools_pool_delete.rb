module Fog
  module Compute
    class Proxmox
      class Real

        def pools_pool_delete(options={})
          options.merge!(
            :method => :delete,
            :command => "pools/#{options['poolid']}",
          )
          options.delete( 'poolid' )
          request(options)
        end

      end
      
      class Mock
        def pools_pool_delete(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
