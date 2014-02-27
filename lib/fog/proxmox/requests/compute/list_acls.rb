module Fog
  module Compute
    class Proxmox
      class Real

        def list_acls(options={})
          options.merge!(
            :command => 'access/acl'
          )
          request(options)
        end

      end
      
      class Mock
        def list_acls(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
