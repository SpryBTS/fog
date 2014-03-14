module Fog
  module Compute
    class Proxmox
      class Real

        def node_task_status(options={})
          %w[ node upid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/tasks/#{options['upid']}/status" )
          %w[ node upid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_task_status(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
