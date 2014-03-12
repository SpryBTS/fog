module Fog
  module Compute
    class Proxmox
      class Real

        def node_aplinfo_post(options={})
          %w[ template storage ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/aplinfo"
          )
          request(options)
        end

      end
      
      class Mock
        def nnode_aplinfo_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
