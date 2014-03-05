module Fog
  module Compute
    class Proxmox
      class Real

        def create_server(options={})
          options.merge!(
            :method => :post,
            :command => 'nodes/' + options['node'] + '/' + options['type']
          )
          %w[ node type ].each { |a| options.delete( a ) }
          request(options)
        end

      end

      class Mock
        def create_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
