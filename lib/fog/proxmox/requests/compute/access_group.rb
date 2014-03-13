module Fog
  module Compute
    class Proxmox
      class Real

        def access_group(options={})
          options.merge!( :command => "access/groups/#{options['groupid']}" )
          %w[ groupid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def access_group(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
