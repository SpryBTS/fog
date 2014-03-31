module Fog
  module Compute
    class Proxmox
      class Real

        def call_server_config(options={})
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/config" )
          %w[node type vmid].each { |s| options.delete( s ) }
          
          case options[:method]
          when :put, :post
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
          else
          end

          request(options)
        end

      end

      class Mock
        def call_server_config(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
