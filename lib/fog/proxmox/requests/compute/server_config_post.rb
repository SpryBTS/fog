module Fog
  module Compute
    class Proxmox
      class Real

        def server_config_post(options={})
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/config"
          )
          %w[node type vmid].each { |s| options.delete( s ) }
          
          # Burst array attributes to individual options
          Fog::Compute::Proxmox::Server::ArrayAttributes.each { |a|
            unless options[a] == nil
              options[a].each_index { |i| options["#{a}#{i}"] = options[a][i] }
              options.delete( a )
            end
          }
          
          # If deleting settings, then don't send those options
          options['delete'].split( ',' ).each { |a|
            options.delete( a.strip )
          } if options.include?( 'delete' )

          request(options)
        end

      end

      class Mock
        def server_config_post(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
