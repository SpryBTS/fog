module Fog
  module Compute
    class Proxmox
      class Real

        def list_servers(options={})
          command = "cluster/resources"
          options[:filters] ||= {}
          options[:filters].merge! ( { :type => [ 'qemu', 'openvz' ] } )
          if options.key?(:vmid)
            options[:filters].merge! ( { :vmid => options[:vmid] } )
            options.delete( :vmid )
          end

          options.merge!(
            :command => command,
          )

          request(options)
        end

      end
      
      class Mock
        def list_servers(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
