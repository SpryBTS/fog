module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_openvz_status(command = nil, options = {})
          
          options[:method] ||= 'GET'
          raise ArgumentError.new("node must be specified") if !options.key?(:node)
          raise ArgumentError.new("vmid must be specified") if !options.key?(:vmid)

          vmid = "#{options[:vmid]}/" if !options.key?(:vmid)
          command = "nodes/#{node}/openvz/#{vmid}/status/#{command}"

          request( command, options )

        end

      end

      class Mock

        def nodes_openvz_status(id,options={})
          server = self.data[:servers].find { |s| s['ctid'].to_s == id.to_s }
          unless server.nil?
            server['status'] = 'running'
          end
        end

      end
    end
  end
end
