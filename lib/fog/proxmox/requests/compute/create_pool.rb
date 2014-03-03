module Fog
  module Compute
    class Proxmox
      class Real

        def create_pool(options={})
          options.merge!(
            :method => :post,
            :command => 'pools',
          )
          request(options)
        end

      end

      class Mock
        def create_pool(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
