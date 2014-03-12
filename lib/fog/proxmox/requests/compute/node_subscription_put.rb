module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_subscription_put(options={})
          %w[ key ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :put,
            :command => "nodes/#{options['node']}/subscription"
          )
          request(options)
        end

      end
      
      class Mock
        def nodes_node_subscription_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
