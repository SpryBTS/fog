module Fog
  module Compute
    class Proxmox
      class Real

        def list_roles(options={})
            
          options.merge!(
            :command => "access/roles"
          )

          request(options)
        end

      end
      
      class Mock
        def list_roles(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
