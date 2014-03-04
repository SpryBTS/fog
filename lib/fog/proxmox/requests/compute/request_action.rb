module Fog
  module Compute
    class Proxmox
      class Real

        def request_action( options = {} )
          options[:method] ||= :get
          options[:command] ||= 'cluster/status'
          
          request( options )
        end

      end

      class Mock

        def request_action
          self.data[:resources]
        end

      end
    end
  end
end
