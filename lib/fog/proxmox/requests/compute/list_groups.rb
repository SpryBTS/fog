module Fog
  module Compute
    class Proxmox
      class Real

        def list_groups(options={})
          command = "access/groups"
          if ( options.key?(:groupid) )
            command = command + '/' + options[:groupid]
            options.delete(:groupid)
          end
            
          options.merge!(
            :command => command
          )

          request(options)
        end

      end
      
      class Mock
        def list_groups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
