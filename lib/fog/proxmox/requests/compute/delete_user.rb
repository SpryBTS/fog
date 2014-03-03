module Fog
  module Compute
    class Proxmox
      class Real

        def delete_user(options={})
          options.merge!(
            :method => :delete,
            :command => 'access/users/' + options['userid'],
          )
          options.delete( 'userid' )
          request(options)
        end

      end
      
      class Mock
        def delete_user(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
