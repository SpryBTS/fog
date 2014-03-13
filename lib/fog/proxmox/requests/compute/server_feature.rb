module Fog
  module Compute
    class Proxmox
      class Real

        def server_feature(options={})
          %w[ feature ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/feature" )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def server_feature(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
