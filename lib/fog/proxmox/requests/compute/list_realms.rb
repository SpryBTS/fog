module Fog
  module Compute
    class Proxmox
      class Real

        def list_realms(options={})
          command = "access/domains"
          if ( options.key?(:realm) )
            command = command + '/' + options[:realm]
            options.delete(:realm)
          end
            
          options.merge!(
            :command => command
          )

          request(options)
        end

      end
      
      class Mock
        def list_realms(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
