module Fog
  module Compute
    class Proxmox
      class Real

        def stores(store = nil, options = {})
          options[:method] ||= 'GET'
          request("storage" + "#{"/" + store unless store.nil?}", options)
        end

      end

      class Mock

        def stores
          self.data[:store]
        end

      end
    end
  end
end
