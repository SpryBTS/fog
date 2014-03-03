module Fog
  module Compute
    class Proxmox
      class Real

        def update_role(options={})
          options.merge!(
            :method => :put,
            :command => 'access/roles/' + options['roleid'],
          )
          options.delete( 'roleid' )
          request(options)
        end

      end
      
      class Mock
        def update_role(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
