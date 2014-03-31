module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_apt_versions(options={})
          options.merge!( :command => "nodes/#{options['node']}/apt/versions" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_apt_versions(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
