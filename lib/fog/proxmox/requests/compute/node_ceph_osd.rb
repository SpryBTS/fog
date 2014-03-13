module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_osd(options={})
          command = "nodes/#{options['node']}/ceph/osd"
          case options[:method]
            when :post
              %w[ dev ].each{ |a|
                raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
              }
            when :delete
              %w[ osdid ].each{ |a|
                raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
              }
              command = "nodes/#{options['node']}/ceph/osd/#{options['osdid']}"
            else
          end
          options.merge!( :command => command )
          %w[ node osdid ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_osd(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
