module Fog
  module Compute
    class Proxmox
      class Real

        def pools_post(options={})
          options.merge!(
            :method => :post,
            :command => 'pools',
          )
          request(options)
        end

      end

      class Mock
        def pools_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
