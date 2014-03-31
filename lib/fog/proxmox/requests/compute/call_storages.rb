module Fog
  module Compute
    class Proxmox
      class Real

        def call_storages(options={})
          options.merge!( :command => "storage" )
          request(options)
        end

      end
      
      class Mock
        def call_storages(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
