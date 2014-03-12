module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_status_post(options={})
          %w[ command ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/status"
          )
          request(options)
        end

      end
      
      class Mock
        def nodes_node_status_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
