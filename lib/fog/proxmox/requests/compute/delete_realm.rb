module Fog
  module Compute
    class Proxmox
      class Real

        def delete_realm(options={})
          options.merge!(
            :method => :delete, 
            :command => 'access/domains/' + options[:realm],
          )
          options.delete( :realm )
          request(options)
        end

      end

      class Mock
        def delete_realm(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
