module Fog
  module Compute
    class Proxmox
      class Real

        def call_access(options={})
          options.merge!( :command => "access" )
          request(options)
        end

      end
      
      class Mock
        def call_access(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
