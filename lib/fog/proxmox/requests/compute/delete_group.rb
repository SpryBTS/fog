module Fog
  module Compute
    class Proxmox
      class Real

        def delete_group(options={})
          options.merge!(
            :method => :delete, 
            :command => 'access/groups/' + options[:groupid],
          )
          options.delete( :groupid )
          request(options)
        end

      end
      
      class Mock
        def delete_group(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
