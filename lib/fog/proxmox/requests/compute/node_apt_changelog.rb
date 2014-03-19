module Fog
  module Compute
    class Proxmox
      class Real

        def node_apt_changelog(options={})
          options.merge!( :command => "nodes/#{options['node']}/apt/changelog")
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_apt_changelog(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
