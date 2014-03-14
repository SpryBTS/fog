module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_resources(options={})
          options.merge!( :command => "cluster/resources" )
          request(options)
        end

      end
      
      class Mock
        def cluster_resources(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
