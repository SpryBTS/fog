module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_backups(options={})
          options.merge!( :command => "cluster/backup" )
          request(options)
        end

      end
      
      class Mock
        def cluster_backups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
