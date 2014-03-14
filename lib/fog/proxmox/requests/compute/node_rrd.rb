module Fog
  module Compute
    class Proxmox
      class Real

        def node_rrd(options={})
          %w[ ds node timeframe ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          }
          options.merge!( :command => "nodes/#{options['node']}/rrd" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def node_rrd(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
