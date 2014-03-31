module Fog
  module Compute
    class Proxmox
      class Real

        def call_cluster_ha(options={})
          options.merge!( :command => "cluster/ha" )
          request(options)
        end

      end
      
      class Mock
        def call_cluster_ha(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
