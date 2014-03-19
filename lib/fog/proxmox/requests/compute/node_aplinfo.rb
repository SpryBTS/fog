module Fog
  module Compute
    class Proxmox
      class Real

        def node_aplinfo(options={})
          options.merge!( :command => "nodes/#{options['node']}/aplinfo" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_aplinfo(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
