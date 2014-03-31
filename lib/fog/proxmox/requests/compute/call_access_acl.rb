module Fog
  module Compute
    class Proxmox
      class Real

        def call_access_acl(options={})
          options.merge!( :command => 'access/acl' )
          request(options)
        end

      end
      
      class Mock
        def call_access_acl(options={})
          Fog::Mock.not_implemented
        end
      end
        
    end
  end
end
