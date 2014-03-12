module Fog
  module Compute
    class Proxmox
      class Real

        def pools_get(options={})
          options.merge!(
            :method => :get,
            :command => "pools/#{options['poolid']}",
          )
          options.delete(:poolid)
          request(options)
        end

      end
      
      class Mock
        def pools_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
