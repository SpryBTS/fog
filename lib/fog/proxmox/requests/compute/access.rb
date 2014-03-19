module Fog
  module Compute
    class Proxmox
      class Real

        def access(options={})
          options.merge!( :command => "access" )
          request(options)
        end

      end
      
      class Mock
        def access(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
