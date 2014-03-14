module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_backup(options={})
          %w[ id ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "access/domains/#{options['id']}" )
          %w[ id ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def cluster_backup(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
