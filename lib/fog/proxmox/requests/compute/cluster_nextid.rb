module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_log(options={})
          options.merge!( :command => "cluster/log" )
          request(options)
        end

      end
      
      class Mock
        def cluster_log(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
