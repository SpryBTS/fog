module Fog
  module Compute
    class Proxmox
      class Real

        def access_password(options={})
          options.merge!( :command => 'access/password' )
          request(options)
        end

      end
      
      class Mock
        def access_password(options={})
          Fog::Mock.not_implemented
        end
      end
        
    end
  end
end
