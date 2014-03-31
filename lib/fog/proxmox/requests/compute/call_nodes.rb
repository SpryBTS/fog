module Fog
  module Compute
    class Proxmox
      class Real

        def call_nodes(options={})
          options.merge!( :command => "nodes" )
          request(options)
        end

      end
      
      class Mock
        def call_nodes(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
