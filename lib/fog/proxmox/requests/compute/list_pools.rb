module Fog
  module Compute
    class Proxmox
      class Real

        def list_pools(options={})
          command = "pools"
          if ( options.key?(:poolid) )
            command = command + '/' + "#{options[:poolid]}"
            options.delete(:poolid)
          end
            
          options.merge!(
            :command => command
          )

          request(options)
        end

      end
      
      class Mock
        def list_pools(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
