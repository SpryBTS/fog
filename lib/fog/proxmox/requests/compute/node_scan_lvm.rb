module Fog
  module Compute
    class Proxmox
      class Real

        def node_scan_usb(options={})
          options.merge!( :command => "nodes/#{options['node']}/scan/usb" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_scan_usb(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
