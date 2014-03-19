module Fog
  module Compute
    class Proxmox
      class Real

        def node_execute(options={})
          options.merge!( :command => "nodes/#{options['node']}/execute" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_execute(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
