module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_status(options={})
          options.merge!( :command => "cluster/status" )
          request(options)
        end

      end
      
      class Mock
        def cluster_status(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
