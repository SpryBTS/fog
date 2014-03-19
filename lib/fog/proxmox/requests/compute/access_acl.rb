module Fog
  module Compute
    class Proxmox
      class Real

        def access_acl(options={})
          options.merge!( :command => 'access/acl' )
          request(options)
        end

      end
      
      class Mock
        def access_acl(options={})
          Fog::Mock.not_implemented
        end
      end
        
    end
  end
end
