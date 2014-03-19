module Fog
  module Compute
    class Proxmox
      class Real

        def node_task_status(options={})
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
