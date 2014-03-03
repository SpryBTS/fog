module Fog
  module Compute
    class Proxmox
      class Real

        def list_users(options={})
          command = "access/users"
          if ( options.key?(:userid) )
            command = command + '/' + "#{options[:userid]}"
            options.delete(:userid)
          end
            
          options.merge!(
            :command => command
          )

          request(options)
        end

      end
      
      class Mock
        def list_users(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
