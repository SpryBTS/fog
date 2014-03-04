module Fog
  module Compute
    class Proxmox
      class Real

        def delete_backup(options={})
          options.merge!(
            :method => :delete, 
            :command => 'cluster/backup/' + options['id'],
          )
          options.delete( 'id' )
          request(options)
        end

      end
      
      class Mock
        def delete_backup(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
