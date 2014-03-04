module Fog
  module Compute
    class Proxmox
      class Real

        def create_server(options={})
          options.merge!(
            :method => :post,
            :command => 'nodes/' + options['node'] + '/' + options['type']
          )
          options.delete['node']
          options.delete['type']
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
