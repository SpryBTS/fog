module Fog
  module Compute
    class Proxmox
      class Real

        def node_ceph_log(options={})
          options.merge!( :command => "nodes/#{options['node']}/ceph/log" )
          %w[ node ].each { |s| options.delete( s ) }
          request(options)
        end

      end
      
      class Mock
        def node_ceph_log(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
