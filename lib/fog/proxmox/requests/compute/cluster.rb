module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_request( options = {} )
          command = options[:command] if options.key?(:command)
          options.reject!{|k,v| ( v.nil? or k == :command) }
          options[:method] ||= 'GET'
          
          response = request("cluster#{'/' + command unless command.nil?}", options )

          response = [response] if response.is_a? Hash

          response

        end

      end

      class Mock

        def cluster_request
          self.data[:resources]
        end

      end
    end
  end
end
