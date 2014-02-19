module Fog
  module Compute
    class Proxmox
      class Real

        def access_request( options = {} )
          command = options[:command] if options.key?(:command)
          options.reject!{|k,v| ( v.nil? or k == :command) }
          options[:method] ||= :get
          
          request("access#{'/' + command unless command.nil?}", options )
        end

        def access_post( options = {} )
          command = options[:command] if options.key?(:command)
          options.reject!{|k,v| ( v.nil? or k == :command) }
          options[:method] ||= :post
          
          request("access#{'/' + command unless command.nil?}", options )
        end
      end

      class Mock

        def access_request
          self.data[:access]
        end

      end
    end
  end
end

