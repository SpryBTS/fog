module Fog
  module Compute
    class Proxmox
      class Real

        def pools(pool = nil, options = {})
          options[:method] ||= 'GET'
          request("pools" + "#{"/" + pool unless pool.nil?}", options)
        end

      end

      class Mock

        def pools
          self.data[:pools]
        end

      end
    end
  end
end
