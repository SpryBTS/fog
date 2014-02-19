require 'fog/compute/models/server'

module Fog
  module Compute
    class Proxmox

      class Qemu < Fog::Compute::Server

        identity  :id

        attribute :ostemplate
        attribute :vmid
        
        attribute :cpu
        attribute :cpus
        attribute :cpuunits
        attribute :description
        attribute :disk
        attribute :diskread
        attribute :diskwrite
        attribute :hostname
        attribute :ip_address
        attribute :maxcpu
        attribute :maxdisk
        attribute :maxmam
        attribute :mem
        attribute :memory
        attribute :name
        attribute :nameserver
        attribute :netif
        attribute :netin
        attribute :netout
        attribute :node
        attribute :onboot
        attribute :password
        attribute :pid
        attribute :pool
        attribute :quotatime
        attribute :quotaugidlimit
        attribute :restore
        attribute :searchdomain
        attribute :status
        attribute :storage
        attribute :swap
        attribute :template
        attribute :type
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
