require 'fog/compute/models/server'

module Fog
  module Compute
    class Proxmox

      class Qemu < Fog::Compute::Server

        identity  :id

        attribute :ostemplate
        attribute :vmid
        
        #config
        attribute :nets
        attribute :ides
        attribute :satas
        attribute :scsis
        attribute :serials
        attribute :unuseds
        attribute :usbs
        attribute :virtios
        
        attribute :parallels
        
        attribute :name
        attribute :bootdisk
        attribute :cores
        attribute :ostype
        attribute :memory
        attribute :sockets
        
        # The following attributes are only needed when creating a new vm
        attr_accessor :iso_dir, :iso_file
        attr_accessor :network_interface_type ,:network_nat_network, :network_bridge_name
        attr_accessor :volume_format_type, :volume_allocation,:volume_capacity, :volume_name, :volume_pool_name, :volume_template_name, :volume_path
        attr_accessor :password
        
        #config
        attribute :cpuunits
        attribute :description
        attribute :hostname
        attribute :ip_address
        attribute :maxcpu
        attribute :memory
        attribute :name
        attribute :nameserver
        attribute :nets
        attribute :ides
        attribute :node
        attribute :onboot
        attribute :password
        attribute :pool
        attribute :quotatime
        attribute :quotaugidlimit
        attribute :restore
        attribute :searchdomain
        attribute :storage
        attribute :swap
        attribute :type

        #status
        attribute :cpu
        attribute :cpus
        attribute :disk
        attribute :diskread
        attribute :diskwrite
        attribute :ha
        attribute :maxdisk
        attribute :maxmem
        attribute :mem
        attribute :netin
        attribute :netout
        attribute :pid
        attribute :qmpstatus
        attribute :status
        attribute :template
        attribute :uptime


        def save
          requires :id
          requires :node
          requires :ostemplate
          raise Fog::Errors::Error.new('Resaving an existing object may create a duplicate') if persisted?
          meta_hash = {}
          create_options = {
            :method => 'POST',

            'node' => node,
            'ostemplate' => ostemplate,
            'ctid' => ctid,

            'cpus' => cpus,
            'description' => description,
            'disk' => disk,
            'force' => force,
            'ip_address' => ip_address,
            'memory' => memory,
            'nameserver' => nameserver,
            'netif' => netif,
            'onboot' => onboot,
            'password' => password,
            'pool' => pool,
            'quotatime' => quotatime,
            'quotaugidlimit' => quotaugidlimit,
            'restore' => restore,
            'searchdomain' => searchdomain,
            'storage' => storage,
            'swap' => swap,
          }
          data = service.nodes_openvz( create_options )
          reload
        end

        def persisted?
          ctid.nil?
        end

        def start
          data = service.nodes_openvz_status( command = 'start', ctid)
        end

        def stop(options = {})
          data = service.nodes_openvz_status( command = 'stop', ctid)
        end

      end

    end
  end
end
