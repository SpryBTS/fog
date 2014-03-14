module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_options(options={})
          options.merge!( :command => "cluster/options" )
          request(options)
        end

      end
      
      class Mock
        def cluster_options(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
