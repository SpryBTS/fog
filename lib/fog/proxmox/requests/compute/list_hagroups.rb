module Fog
  module Compute
    class Proxmox
      class Real

        def list_hagroups(options={})
          command = "cluster/ha/groups"
          if ( options.key?(:id) )
            command = command + '/' + options[:id]
            options.delete(:id)
          end
            
          options.merge!(
            :command => command
          )

          request(options)
        end

      end
      
      class Mock
        def list_hagroups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
