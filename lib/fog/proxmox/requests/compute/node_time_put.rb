module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_time_post(options={})
          %w[ timezone ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :put,
            :command => "nodes/#{options['node']}/time"
          )
          request(options)
        end

      end
      
      class Mock
        def nodes_time_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
