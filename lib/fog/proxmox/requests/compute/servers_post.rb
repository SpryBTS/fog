module Fog
  module Compute
    class Proxmox
      class Real

        def servers_post(options={})
          %w[ ostemplate ].each{ |a|
            raise Fog::Compute::Proxmox::BadRequest.new("Required parameter #{a} is missing.") unless options.include?( a )
          } if options['type'] = 'openvz'

          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/#{options['type']}"
          )

          # Burst array attributes to individual components
          Fog::Compute::Proxmox::Server::ArrayAttributes.each { |a|
            unless options[a] == nil
              options[a].each_index { |i| options["#{a}#{i}"] = options[a][i] }
              options.delete( a )
            end
          }
          
          request(options)
        end

      end

      class Mock
        def servers_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
