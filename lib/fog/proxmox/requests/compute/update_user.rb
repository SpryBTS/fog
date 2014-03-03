module Fog
  module Compute
    class Proxmox
      class Real

        def update_user(options={})
          options.merge!(
            :method => :put,
            :command => 'access/users/' + options['userid'],
          )
          options.delete( 'userid' )
          request(options)
        end

      end
      
      class Mock
        def update_user(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
