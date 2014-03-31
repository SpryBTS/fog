module Fog
  module Compute
    class Proxmox
      class Real

        def call_cluster_ha_group(options={})
          options.merge!( :command => "cluster/ha/groups/#{options['id']}" )
          %w[ id ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_cluster_ha_group(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
