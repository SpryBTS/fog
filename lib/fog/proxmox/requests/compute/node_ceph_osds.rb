module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_osds(options={})
          %w[ node ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          %w[ dev ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :post
          command = "nodes/#{options['node']}/ceph/osd"
          options.merge!( :command => command )
          %w[ node dev ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_osds(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
