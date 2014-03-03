module Fog
  module Compute
    class Proxmox
      class Real

        def create_user(options={})
          options.merge!(
            :method => :post,
            :command => 'access/users',
          )
          request(options)
        end

      end

      class Mock
        def create_user(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
