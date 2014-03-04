module Fog
  module Compute
    class Proxmox
      class Real

        def update_hagroup(options={})
          options.merge!(
            :method => :put,
            :command => 'cluster/ha/groups/' + options['id'],
          )
          options.delete( 'id' )
          request(options)
        end

      end
      
      class Mock
        def update_hagroup(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
