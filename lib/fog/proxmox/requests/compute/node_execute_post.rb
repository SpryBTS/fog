module Fog
  module Compute
    class Proxmox
      class Real

        def node_execute_post(options={})
          %w[ commands ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/execute"
          )
          request(options)
        end

      end
      
      class Mock
        def node_execute_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
