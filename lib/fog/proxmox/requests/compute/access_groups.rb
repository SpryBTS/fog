module Fog
  module Compute
    class Proxmox
      class Real

        def access_groups(options={})
          options.merge!( :command => "access/groups" )
          request(options)
        end

      end
      
      class Mock
        def access_groups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
