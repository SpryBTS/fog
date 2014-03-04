module Fog
  module Compute
    class Proxmox
      class Real

        def list_stores(options={})
          command = "storage"
          if ( options.key?(:storage) )
            command = command + '/' + options[:storage]
            options.delete(:storage)
          end
            
          options.merge!(
            :command => command
          )

          request(options)
        end

      end
      
      class Mock
        def list_stores(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
