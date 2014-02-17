module Fog
  module Compute
    class Proxmox
      class Real

        def nodes(node = nil, options = {})
          options[:method] ||= 'GET'
          request("nodes" + "#{"/" + node unless node.nil?}", options)
        end

      end

      class Mock

        def nodes
          self.data[:nodes]
        end

      end
    end
  end
end
