module Fog
  module Compute
    class Proxmox
      class Real

        def call_access_domain(options={})
          options.merge!( :command => "access/domains/#{options['realm']}" )
          %w[ realm ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def call_access_domain(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
