module Fog
  module Compute
    class Proxmox
      class Real

        def template_server(options={})
          options.merge!(
            :method => :post,
            :command => 'nodes/' + options['node'] + '/' + options['type'] + '/' + "#{options['vmid']}" + '/template',
          )
          %w[ node type vmid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def template_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
