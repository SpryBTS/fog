module Fog
  module Compute
    class Proxmox
      class Real

        def call_action_generic(options={})
          options[:method] ||= :get
          options[:command] ||= 'cluster/status'
          request( options )
        end

      end

      class Mock

        def call_action_generic(options={})
          self.data[:resources]
        end

      end
    end
  end
end
