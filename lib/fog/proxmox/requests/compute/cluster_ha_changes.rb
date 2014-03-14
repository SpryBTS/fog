module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_ha_changes(options={})
          options.merge!( :command => "cluster/ha/changes" )
          request(options)
        end

      end
      
      class Mock
        def cluster_ha_changes(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
