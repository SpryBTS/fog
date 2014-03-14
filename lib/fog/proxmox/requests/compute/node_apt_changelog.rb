module Fog
  module Compute
    class Proxmox
      class Real

        def node_apt_changelog(options={})
          %w[ name node ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
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
