module Fog
  module Compute
    class Proxmox
      class Real

        def server_clone(options={})
          %w[ newid ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/clone" )
          %w[node type vmid].each { |s| options.delete( s ) }
          request(options)
        end

      end

      class Mock
        def server_clone(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
