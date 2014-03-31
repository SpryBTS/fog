module Fog
  module Compute
    class Proxmox
      class Real

        def call_pool(options={})
          options.merge!( :command => "pools/#{options['poolid']}" )
          options.delete( 'poolid' )
          request(options)
        end

      end
      
      class Mock
        def call_pool(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
