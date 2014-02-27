module Fog
  module Compute
    class Proxmox
      class Real

        def create_acl(options={})
          options.merge!(
            :method => :put, 
            :command => 'access/acl',
          )
          request(options)
        end

      end
      
      class Mock
        def create_acl(options={})
          Fog::Mock.not_implemented
        end
      end
        
    end
  end
end
