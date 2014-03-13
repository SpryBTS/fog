module Fog
  module Compute
    class Proxmox
      class Real

        def access_groups(options={})
          command = "access/groups"
          if ( options.include?(:groupid) )
            command = command + '/' + options[:groupid]
            options.delete(:groupid)
          end
          options.merge!( :command => command )
          request(options)
        end

      end
      
      class Mock
        def access_groups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
