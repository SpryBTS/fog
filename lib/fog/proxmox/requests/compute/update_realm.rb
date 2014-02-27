module Fog
  module Compute
    class Proxmox
      class Real

        def update_realm(options={})
          options.merge!(
            :method => :put,
            :command => 'access/domains/' + options['realm'],
          )
          options.delete( 'realm' )
          request(options)
        end

      end
      
      class Mock
        def update_realm(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
