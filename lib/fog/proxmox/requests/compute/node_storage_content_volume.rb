module Fog
  module Compute
    class Proxmox
      class Real

        def node_storage_content_volume(options={})
          options.merge!( :command => "nodes/#{options['node']}/storage/#{options['storage']}/content/#{options['volume']}" )
          %w[ node storage ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_storage_content_volume(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
