module Fog
  module Compute
    class Proxmox
      class Real

        def list_roles(options={})
          command = "access/roles"
          if ( options.key?(:roleid) )
            command = command + '/' + "#{options[:roleid]}"
            options.delete(:roleid)
          end
            
          options.merge!(
            :command => command
          )

          request(options)
        end

      end
      
      class Mock
        def list_roles(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
