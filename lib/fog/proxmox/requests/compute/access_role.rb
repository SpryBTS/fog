module Fog
  module Compute
    class Proxmox
      class Real

        def access_role(options={})
          options.merge!( :command => "access/roles/#{options['roleid']}" )
          request(options)
        end

      end
      
      class Mock
        def access_role(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
