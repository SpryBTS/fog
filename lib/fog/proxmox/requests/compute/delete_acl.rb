module Fog
  module Compute
    class Proxmox
      class Real

        def delete_acl(options={})
          options.merge!(
            :method => :put, 
            :command => 'access/acl',
            :delete => 1,
          )
          request(options)
        end

      end

      class Mock
        def delete_acl(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
