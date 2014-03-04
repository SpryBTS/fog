module Fog
  module Compute
    class Proxmox
      class Real

        def create_hagroup(options={})
          options.merge!(
            :method => :post,
            :command => 'cluster/ha/groups',
          )
          request(options)
        end

      end

      class Mock
        def create_hagroup(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
