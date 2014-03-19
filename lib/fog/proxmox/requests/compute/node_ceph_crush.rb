module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_crush(options={})
          options.merge!( :command => "nodes/#{options['node']}/ceph/crush" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_crush(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
