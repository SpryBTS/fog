module Fog
  module Compute
    class Proxmox
      class Real

        def update_group(options={})
          options.merge!(
            :method => :put,
            :command => 'access/groups/' + options['groupid'],
          )
          options.delete( 'groupid' )
          request(options)
        end

      end
      
      class Mock
        def update_group(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
