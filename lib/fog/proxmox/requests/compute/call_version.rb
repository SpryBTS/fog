module Fog
  module Compute
    class Proxmox
      class Real

        def call_version(options={})
          options.merge!( :command => "version" )
          request(options)
        end

      end
      
      class Mock
        def call_version(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
