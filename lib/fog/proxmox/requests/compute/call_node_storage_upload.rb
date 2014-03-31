module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_storage_upload(options={})
          options.merge!( :command => "nodes/#{options['node']}/storage/#{options['storage']}/upload" )
          %w[ node storage ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_storage_upload(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
