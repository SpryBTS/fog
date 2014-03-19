module Fog
  module Compute
    class Proxmox
      class Real

        def version(options={})
          options.merge!( :command => "version" )
          request(options)
        end

      end
      
      class Mock
        def version(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
