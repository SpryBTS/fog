module Fog
  module Compute
    class Proxmox
      class Real

        def call_access_users(options={})
          options.merge!( :command => "access/users" )
          request(options)
        end

      end
      
      class Mock
        def call_access_users(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
