module Fog
  module Compute
    class Proxmox
      class Real

        def access_ticket(options={})
          options.merge!( :command => 'access/ticket' )
          request(options)
        end

      end
      
      class Mock
        def access_ticket(options={})
          Fog::Mock.not_implemented
        end
      end
        
    end
  end
end
