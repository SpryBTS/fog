module Fog
  module Compute
    class Proxmox
      class Real

        def create_backup(options={})
          options.merge!(
            :method => :post,
            :command => 'cluster/backup',
          )
          request(options)
        end

      end
      
      class Mock
        def create_backup(options={})
          Fog::Mock.not_implemented
        end
      end
      
    end
  end
end
