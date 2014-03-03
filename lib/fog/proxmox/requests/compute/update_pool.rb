module Fog
  module Compute
    class Proxmox
      class Real

        def update_pool(options={})
          options.merge!(
            :method => :put,
            :command => 'pools/' + options['poolid'],
          )
          options.delete( 'poolid' )
          request(options)
        end

      end
      
      class Mock
        def update_pool(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
