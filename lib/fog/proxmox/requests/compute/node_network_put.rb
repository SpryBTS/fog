module Fog
  module Compute
    class Proxmox
      class Real

        def node_network_put(options={})
          %w[ iface type ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :get,
            :command => "nodes/#{options['node']}/network/#{options['iface']}"
          )
          request(options)
        end

      end
      
      class Mock
        def node_network_put(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
