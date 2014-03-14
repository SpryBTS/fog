module Fog
  module Compute
    class Proxmox
      class Real

        def node_scan_nfs(options={})
          %w[ node server ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/scan/nfs" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_scan_nfs(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
