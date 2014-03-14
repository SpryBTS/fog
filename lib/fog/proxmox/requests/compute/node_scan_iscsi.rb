module Fog
  module Compute
    class Proxmox
      class Real

        def node_scan_iscsi(options={})
          %w[ node portal ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/scan/iscsi" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_scan_iscsi=(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
