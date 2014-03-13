module Fog
  module Compute
    class Proxmox
      class Real

        def node_storage_content(options={})
          %w[ filename size vmid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :post
          %w[ storage ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/storage/#{options['storage']}/content" )
          %w[ node storage ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_storage_content(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
