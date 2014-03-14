module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_ha_config(options={})
          options.merge!( :command => "cluster/ha/config" )
          request(options)
        end

      end
      
      class Mock
        def cluster_ha_config(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
