module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_rrddata_get(options={})
          %w[ timeframe ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :command => "nodes/#{options['node']}/rrddata"
          )
          request(options)
        end

      end
      
      class Mock
        def nodes_node_rrddata_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
