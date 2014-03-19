module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_ha_groups(options={})
          options.merge!( :command => "cluster/ha/groups" )
          request(options)
        end

      end
      
      class Mock
        def cluster_ha_groups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
