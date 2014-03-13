module Fog
  module Compute
    class Proxmox
      class Real

        def sendkey_server(options={})
          %w[ key ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + "#{options['vmid']}" + '/sendkey' )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def sendkey_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
