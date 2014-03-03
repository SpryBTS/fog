module Fog
  module Compute
    class Proxmox
      class Real

        def delete_role(options={})
          options.merge!(
            :method => :delete,
            :command => 'access/roles/' + options['roleid'],
          )
          options.delete( 'roleid' )
          request(options)
        end

      end
      
      class Mock
        def delete_role(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
