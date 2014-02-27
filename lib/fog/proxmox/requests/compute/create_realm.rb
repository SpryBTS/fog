module Fog
  module Compute
    class Proxmox
      class Real

        def create_realm(options={})
          options.merge!(
            :method => :post,
            :command => 'access/domains',
          )
          request(options)
        end

      end
      
      class Mock
        def create_realm(options={})
          Fog::Mock.not_implemented
        end
      end
      
    end
  end
end
