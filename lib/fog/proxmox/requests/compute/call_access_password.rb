module Fog
  module Compute
    class Proxmox
      class Real

        def call_access_password(options={})
          options.merge!( :command => 'access/password' )
          request(options)
        end

      end
      
      class Mock
        def call_access_password(options={})
          Fog::Mock.not_implemented
        end
      end
        
    end
  end
end
