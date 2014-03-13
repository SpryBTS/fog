module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_pools_delete(options={})
          command = "nodes/#{options['node']}/ceph/pools"
          case options[:method]
            when :delete
              %w[ name ].each{ |a|
                raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
              }
              command = "nodes/#{options['node']}/ceph/pools/#{options['name']}"
            when :post
              %w[ name ].each{ |a|
                raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
              }
            else
          end
          options.merge!( :command => command )
          %w[ node name ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_pools_delete(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
