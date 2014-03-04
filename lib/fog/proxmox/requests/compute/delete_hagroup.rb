module Fog
  module Compute
    class Proxmox
      class Real

        def delete_hagroup(options={})
          options.merge!(
            :method => :delete,
            :command => 'cluster/ha/groups/' + options['id'],
          )
          options.delete( 'id' )
          request(options)
        end

      end
      
      class Mock
        def delete_hagroup(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
