module Fog
  module Compute
    class Proxmox
      class Real

        def create_role(options={})
          options.merge!(
            :method => :post,
            :command => 'access/roles',
          )
          request(options)
        end

      end

      class Mock
        def create_role(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
