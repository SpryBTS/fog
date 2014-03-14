module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_nextid(options={})
          options.merge!( :command => "cluster/nextid" )
          request(options)
        end

      end
      
      class Mock
        def cluster_nextid(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
