module Fog
  module Compute
    class Proxmox
      class Real

        def node_aplinfo_get(options={})
          options.merge!(
            :command => "nodes/#{options['node']}/aplinfo"
          )
          request(options)
        end

      end
      
      class Mock
        def node_aplinfo_get(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
