module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_request( options = {} )
          command = options[:command] if options.key?(:command)
          options.reject!{|k,v| ( v.nil? or k == :command) }
          options[:method] ||= 'GET'
          
          response = request("nodes#{'/' + command unless command.nil?}", options )

          response = [response] if response.is_a? Hash

          response.map!{ |r|
            r['id'].gsub!(/^\/?#{r['type']}\//,'') if ( r.key?('id') and r.key?('type') )
            r
          }

          response

        end

      end

      class Mock

        def nodes_request
          self.data[:nodes]
        end

      end
    end
  end
end
