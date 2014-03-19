require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Node < Fog::Model

        identity  :node

        attribute :type
        attribute :id
        attribute :level
        attribute :maxcpu
        attribute :maxmem

        def save
          raise Fog::Compute::Proxmox::NotImplemented.new('Creating / updating a node is not supported.')
        end
        
        def destroy
          raise Fog::Compute::Proxmox::NotImplemented.new('Destroying a node is not supported.')
        end

        def aplinfo( options = {} )
          if options.empty?
            service.node_aplinfo( service_defaults )
          else
            requires :storage
            options[:method] = :post
            service.node_aplinfo( options.merge!( service_defaults ) )
          end
        end

        def bootlog
          service.node_bootlog( service_defaults )
        end
        
        def dns( options = {} )
          options.merge!( service_defaults )
          options.merge!( :method => :put ) unless options.empty?
          service.node_dns( options )
        end
          
        def execute( options = {} )
          service.node_execute( options.merge!( service_defaults ) )
        end
        private
        
        def service_defaults
          requires :node
          
          {
            'node' => node,
          }
        end

       end

    end
  end
end
