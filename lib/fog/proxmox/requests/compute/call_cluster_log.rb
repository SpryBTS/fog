module Fog
  module Compute
    class Proxmox
      class Real

        def call_cluster_log(options={})
          options.merge!( :command => "cluster/nextid" )
          request(options)
        end

      end
      
      class Mock
        def call_cluster_log(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
