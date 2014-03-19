module Fog
  module Compute
    class Proxmox
      class Real

        def node(options={})
          options.merge!( :command => "nodes/#{options['node']}" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
