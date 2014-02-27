module Fog
  module Compute
    class Proxmox
      class Real

        def create_group(options={})
          options.merge!(
            :method => :post,
            :command => 'access/groups',
          )
          request(options)
        end

      end

      class Mock
        def create_group(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
