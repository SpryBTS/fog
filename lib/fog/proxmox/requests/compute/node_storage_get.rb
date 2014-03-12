module Fog
  module Compute
    class Proxmox
      class Real

        def node_storage_get(options={})
          %w[ storage ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :command => "nodes/#{options['node']}/storage/#{options['storage']}"
          )
          request(options)
        end

      end
      
      class Mock
        def node_storage_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
