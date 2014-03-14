module Fog
  module Compute
    class Proxmox
      class Real

        def node_apt_update(options={})
          %w[ node ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/apt/update" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_apt_update_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
