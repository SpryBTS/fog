module Fog
  module Compute
    class Proxmox
      class Real

        def pools_request( options = {} )
          command = options[:command] if options.key?(:command)
          options.reject!{|k,v| ( v.nil? or k == :command) }
          options[:method] ||= 'GET'
          
          request("pools#{'/' + command unless command.nil?}", options )
        end

      end

      class Mock

        def pools_request
          self.data[:pools]
        end

      end
    end
  end
end
