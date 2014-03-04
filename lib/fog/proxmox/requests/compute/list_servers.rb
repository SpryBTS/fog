module Fog
  module Compute
    class Proxmox
      class Real

        def list_servers(options={})
          command = "cluster/resources"
          options[:filters] ||= {}
          options[:filters].merge! ( { :type => [ 'qemu', 'openvz' ] } )
          options[:filters].merge! ( { :vmid => options[:vmid] } ) if options.key?(:vmid)

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
