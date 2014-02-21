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
    end
  end
end
