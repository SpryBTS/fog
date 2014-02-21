module Fog
  module Compute
    class Proxmox
      class Real

        def create_acl(options={})
          options.merge!(
            :method => :put, 
            :command => 'access/acl',
            :delete => 0,
          )
          request(options)
        end

      end
    end
  end
end
