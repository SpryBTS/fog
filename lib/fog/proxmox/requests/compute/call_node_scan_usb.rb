module Fog
  module Compute
    class Proxmox
      class Real

        def call_node_scan_usb(options={})
          options.merge!( :command => "nodes/#{options['node']}/scan/lvm" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_node_scan_usb(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
