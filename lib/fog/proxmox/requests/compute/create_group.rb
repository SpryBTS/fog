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
    end
  end
end
