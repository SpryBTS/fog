module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_config(options={})
          %w[ node ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/ceph/config" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_config(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
