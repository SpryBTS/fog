module Fog
  module Compute
    class Proxmox
      class Real

        def cluster(options={})
          options.merge!( :command => "cluster" )
          request(options)
        end

      end
      
      class Mock
        def cluster(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
