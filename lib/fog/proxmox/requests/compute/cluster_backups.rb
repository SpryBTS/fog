module Fog
  module Compute
    class Proxmox
      class Real

        def cluster_backups(options={})
          %w[ startime ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :post
          options.merge!( :command => "cluster/backup" )
          request(options)
        end

      end
      
      class Mock
        def cluster_backups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
