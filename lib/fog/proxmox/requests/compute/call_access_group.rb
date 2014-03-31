module Fog
  module Compute
    class Proxmox
      class Real

        def call_access_group(options={})
          options.merge!( :command => "access/groups/#{options['groupid']}" )
          %w[ groupid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_access_group(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
