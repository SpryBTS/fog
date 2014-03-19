module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_backup(options={})
          options.merge!( :command => "cluster/backup/#{options['id']}" )
          %w[ id ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def cluster_backup(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
