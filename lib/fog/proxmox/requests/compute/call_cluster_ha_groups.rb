module Fog
  module Compute
    class Proxmox
      class Real

        def call_cluster_ha_groups(options={})
          options.merge!( :command => "cluster/ha/groups" )
          request(options)
        end

      end
      
      class Mock
        def call_cluster_ha_groups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
