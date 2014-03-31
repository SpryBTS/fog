module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_storage_rrd(options={})
          options.merge!( :command => "nodes/#{options['node']}/storage/#{options['storage']}/rrd" )
          %w[ node storage ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_storage_rrd(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
