module Fog
  module Compute
    class Proxmox
      class Real

        def access_user(options={})
          options.merge!( :command => "access/domains/#{options['userid']}" )
          %w[ userid ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def access_user(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
