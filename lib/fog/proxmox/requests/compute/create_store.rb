module Fog
  module Compute
    class Proxmox
      class Real

        def create_store(options={})
          options.merge!(
            :method => :post,
            :command => 'storage',
          )
          request(options)
        end

      end

      class Mock
        def create_store(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
