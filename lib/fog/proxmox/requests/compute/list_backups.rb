module Fog
  module Compute
    class Proxmox
      class Real

        def list_backups(options={})
          command = "cluster/backup"
          if ( options.key?(:id) )
            command = command + '/' + "#{options[:id]}"
            options.delete(:id)
          end
            
          options.merge!(
            :command => command
          )

          request(options)
        end

      end
      
      class Mock
        def list_backups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
