module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_time(options={})
          options.merge!( :command => "nodes/#{options['node']}/time" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def nodes_time(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
