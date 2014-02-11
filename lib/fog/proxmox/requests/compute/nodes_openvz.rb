module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_openvz(command, options = {})
          
          options[:method] ||= 'GET'
          raise ArgumentError.new("node must be specified") if !options.key?(:node)

          vmid = "#{options[:vmid]}/" if !options.key?(:vmid)
          command = "nodes/#{node}/openvz/#{vmid}#{command}"

          request( command, options )

        end

      end

      class Mock

        def nodes_openvz(vmid = nil, commmand = nil, options = {})
          # When a new fake server is created we set the status to stopped
          options['status'] = 'stopped'
          self.data[:servers] << options
        end

      end
    end
  end
end
