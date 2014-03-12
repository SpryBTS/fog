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

        def aplinfo
          service.nodes_node_aplinfo_get( service_defaults )
        end
        def aplinfo( options = {} )
          requires :storage
          service.nodes_node_aplinfo_post( service_defaults.merge options )
        end

        def bootlog
          service.nodes_node_bootlog_get( service_defaults )
        end
        
        def dns
          service.nodes_node_dns_get( service_defaults )
        end
        def dns( options = {} )
          service.nodes_node_dns_post( service_defaults.merge options )
        end
          
        def execute( options = {} )
          service.nodes_node_execute_post( service_defaults.merge options )
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
