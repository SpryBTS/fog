module Fog
  module Compute
    class Proxmox
      class Real

        def node_storage_content_volume_post(options={})
          %w[ storage target volume ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/storage/#{options['storage']}/content/#{options['volume']}"
          )
          %w[ node storage target volume ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_storage_content_volume_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
