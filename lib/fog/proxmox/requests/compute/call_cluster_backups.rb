module Fog
  module Compute
    class Proxmox
      class Real

        def call_cluster_backups(options={})
          options.merge!( :command => "cluster/backup" )
          request(options)
        end

      end
      
      class Mock
        def call_cluster_backups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
