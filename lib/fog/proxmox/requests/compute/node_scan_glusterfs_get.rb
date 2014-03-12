module Fog
  module Compute
    class Proxmox
      class Real

        def node_scan_glusterfs_get(options={})
          %w[ server ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!(
            :command => "nodes/#{options['node']}/scan/glusterfs"
          )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_scan_glusterfs_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
