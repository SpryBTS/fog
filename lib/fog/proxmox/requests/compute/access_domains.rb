module Fog
  module Compute
    class Proxmox
      class Real

        def access_domains(options={})
          options.merge!( :command => "access/domains" )
          request(options)
        end

      end
      
      class Mock
        def access_domains(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
