module Fog
  module Compute
    class Proxmox
      class Real

        def nodes(command, filters = {}, options = {})
          options[:method] = 'GET'
          request( "nodes#{'/'.options[:node] if options.key?[:node]}", options )
        end

      end

      class Mock

        def nodes(command, filters = {}, options = {})
          self.data[:nodes] << ['localhost'] 
        end

      end
    end
  end
end
