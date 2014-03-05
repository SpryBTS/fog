module Fog
  module Compute
    class Proxmox
      class Real

        def delete_task(options={})
          options.merge!(
            :method => :delete,
            :command => 'access/nodes/' + options['node'] + '/tasks/' + options['upid'],
          )
          %w[ node upid ].each { |a| options.delete( a ) }
          request(options)
          nil
        end

      end
      
      class Mock
        def delete_task(options={})
          Fog::Mock.not_implemented
          nil
        end
      end

    end
  end
end
