module Fog
  module Compute
    class Proxmox
      class Real

        def stores_request( options = {} )
          command = options[:command] if options.key?(:command)
          options.reject!{|k,v| ( v.nil? or k == :command) }
          options[:method] ||= 'GET'
          
          request("storage#{'/' + command unless command.nil?}", options )
        end

      end

      class Mock

        def stores_request
          self.data[:store]
        end

      end
    end
  end
end
