module Fog
  module Compute
    class Proxmox
      class Real

        def nodes_time(options={})
          %w[ node timezone ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options[:method] == :put
          options.merge!( :command => "nodes/#{options['node']}/time" )
          %w[ node ].each { |a| options.delete( a ) }
          request(options)
        end

      end
      
      class Mock
        def nodes_time(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
