module Fog
  module Compute
    class Proxmox
      class Real

        def call_cluster_nextid(options={})
          options.merge!( :command => "cluster/log" )
          request(options)
        end

      end
      
      class Mock
        def call_cluster_nextid(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
