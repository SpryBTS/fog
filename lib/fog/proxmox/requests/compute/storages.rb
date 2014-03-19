module Fog
  module Compute
    class Proxmox
      class Real

        def storages(options={})
          options.merge!( :command => "storage" )
          request(options)
        end

      end
      
      class Mock
        def storages(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
