module Fog
  module Compute
    class Proxmox
      class Real

        def delete_pool(options={})
          options.merge!(
            :method => :delete,
            :command => 'pools/' + options['poolid'],
          )
          options.delete( 'poolid' )
          request(options)
        end

      end
      
      class Mock
        def delete_pool(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
