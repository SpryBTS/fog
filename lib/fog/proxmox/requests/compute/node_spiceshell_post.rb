module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_node_spiceshell_post(options={})
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/spiceshell"
          )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def nodes_node_spiceshell_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
