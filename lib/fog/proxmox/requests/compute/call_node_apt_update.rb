module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_apt_update(options={})
          options.merge!( :command => "nodes/#{options['node']}/apt/update" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_apt_update(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
