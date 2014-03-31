module Fog
  module Compute
    class Proxmox
      class Real

        def call_cluster(options={})
          options.merge!( :command => "cluster" )
          request(options)
        end

      end
      
      class Mock
        def call_cluster(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
