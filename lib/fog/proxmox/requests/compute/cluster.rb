module Fog
  module Compute
    class Proxmox
      class Real

        def cluster(command = 'resources', options = {})
          options[:method] ||= 'GET'
          request("cluster/#{command}", options)
        end

      end

      class Mock

        def cluster_resources
          self.data[:resources]
        end

      end
    end
  end
end
