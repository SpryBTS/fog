module Fog
  module Compute
    class Proxmox
      class Real

        def node_network_delete(options={})
          %w[ node iface ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/network/#{options['iface']}" )
          %w[ node iface ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_network_delete(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
