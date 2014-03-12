module Fog
  module Compute
    class Proxmox
      class Real

        def node_scan_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/scan"
          )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_scan_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
