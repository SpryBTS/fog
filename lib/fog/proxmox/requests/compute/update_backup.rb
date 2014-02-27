module Fog
  module Compute
    class Proxmox
      class Real

        def update_backup(options={})
          options.merge!(
            :method => :put,
            :command => 'cluster/backup/' + options['id'],
          )
          options.delete( 'id' )
          request(options)
        end

      end
      
      class Mock
        def update_backup(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
