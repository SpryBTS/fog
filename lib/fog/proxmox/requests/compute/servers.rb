module Fog
  module Compute
    class Proxmox
      class Real

        def servers(options={})

          case options[:method]

            when :post
              # Burst array attributes to individual components
              Fog::Compute::Proxmox::Server::ArrayAttributes.each { |a|
                unless options[a] == nil
                  options[a].each_index { |i| options["#{a}#{i}"] = options[a][i] }
                  options.delete( a )
                end
              }

            when :get
              options[:filters] ||= {}
              options[:filters].merge! ( { :type => [ 'qemu', 'openvz' ] } )
              if options.key?(:vmid)
                options[:filters].merge! ( { :vmid => options[:vmid] } )
                options.delete( :vmid )
              end
          end
          options.merge!( :command => "nodes/#{options['node']}/#{options['type']}" )
          %w[ node type ].each { |a| options.delete( a ) }
          request(options)
        end

      end

      class Mock
        def servers(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
