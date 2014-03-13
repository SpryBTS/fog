module Fog
  module Compute
    class Proxmox
      class Real

        def access_groups(options={})
          command = "access/groups"
          if ( options.include?(:groupid) )
            command = command + '/' + options[:groupid]
            options.delete(:groupid)
          end
          options.merge!( :command => command )
          request(options)
        end


        %w[ key ].each{ |a|
          raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
        } if options[:method] = :put
        options.merge!( :command => "nodes/#{options['node']}/subscription" )
        %w[ node ].each { |a| options.delete( a ) }
        request(options)



      end
      
      class Mock
        def access_groups(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
