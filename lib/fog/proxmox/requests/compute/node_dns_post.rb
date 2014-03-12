module Fog
  module Compute
    class Proxmox
      class Real

        def node_dns_post(options={})
          %w[ search ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/dns"
          )
          request(options)
        end

      end
      
      class Mock
        def node_dns_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
