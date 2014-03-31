require 'fog/compute/models/server'

module Fog
  module Compute
    class Proxmox

      class Server < Fog::Compute::Server

        # The attributes listed here are arrays. Config data is returned from the Proxmox
        # API in a <attribute><index> name format. These are converted into positional array entryies.
        ArrayAttributes = [ :hostpci, :ide, :net, :parallel, :sata, :scsi, :unused, :usb, :virtio ]
        
        identity  :vmid

        # Common attributes
        attribute :node
        attribute :type
        attribute :cpuunits
        attribute :description
        attribute :digest
        attribute :memory
        attribute :onboot
        attribute :pool
        attribute :status
        attribute :storage
        
        # QEMU specific
        attribute :acpi
        attribute :agent
        attribute :archive
        attribute :args
        attribute :autostart
        attribute :balloon
        attribute :boot
        attribute :bootdisk
        attribute :cdrom
        attribute :cores
        attribute :cpu
        attribute :cpulimit
        attribute :freeze
        attribute :hostpci
        attribute :hotplug
        attribute :ide
        attribute :keyboard
        attribute :kvm
        attribute :localtime
        attribute :lock
        attribute :machine
        attribute :migrate_downtime
        attribute :migrate_speed
        attribute :name
        attribute :net
        attribute :ostype
        attribute :parallel
        attribute :reboot
        attribute :sata
        attribute :scsi
        attribute :scsihw
        attribute :serial
        attribute :shares
        attribute :smp
        attribute :sockets
        attribute :startdate
        attribute :startup
        attribute :tablet
        attribute :tdf
        attribute :template
        attribute :unique
        attribute :unused
        attribute :usb
        attribute :vga
        attribute :virtio
        attribute :watchdog

        # Openvz specific
        attribute :cpus
        attribute :disk
        attribute :hostname
        attribute :ip_address,      :aliases => 'ip'
        attribute :nameserver
        attribute :netif
        attribute :password
        attribute :quotatime
        attribute :quotaugidlimit
        attribute :searchdomain
        attribute :swap
        
        attr_accessor :loaded

        def initialise(attributes={})
          self.loaded = false
          super
        end
        
        def save(newoptions = {})
          options = attributes.merge newoptions
          options.merge! service_defaults

          if digest.nil? then
            service.call_create_server( options )
          else
            service.call_update_server( options )
          end
        end
        
        # @param [Hash] options
        # :skiplock - boolean (qemu)
        def destroy(options = {})
          service.call_delete_server( service_defaults.merge options )
        end

        # @param [Hash] options
        # :skiplock - boolean (qemu)
        def reset(options = {})
          service.call_reset_server( service_defaults.merge options )
        end

        # @param [Hash] options
        # :skiplock - boolean (qemu)
        def resume(options = {})
          service.call_resume_server( service_defaults.merge options )
        end

        # @param [Hash] options
        # :forceStop - boolean
        # :keepActive - boolean (qemu)
        # :skiplock - boolean (qemu)
        # :timeout - integer
        def shutdown(options = {})
          service.call_shutdown_server( service_defaults.merge options )
        end

        # @param [Hash] options
        # :migratedfrom - string (qemu)
        # :skiplock - boolean (qemu)
        # :stateuri - string (qemu)
        def start(options = {})
          service.call_start_server( service_defaults.merge options )
        end

        # @param [Hash] options
        # :keepActive - boolean (qemu)
        # :migratedfrom - string (qemu)
        # :skiplock - boolean (qemu)
        # :timeout - integer (qemu)
        def stop(options = {})
          service.call_stop_server( service_defaults.merge options )
        end

        def ubc
          service.call_ubc_server( service_defaults )
        end

        # @param [Hash] options
        # :skiplock - boolean (qemu)
        def suspend(options = {})
          service.call_suspend_server( service_defaults.merge options )
        end

        def mount
          service.call_mount_server( service_defaults )
        end

        def umount
          service.call_umount_server( service_defaults )
        end

        # @param [Hash] options
        # :newid - integer
        # :description - string
        # :format - enum
        # :full - boolean
        # :name - string
        # :pool - string
        # :snapname - string
        # :storage - string
        # :target - string
        def clone(options = {})
          service.call_clone_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :target - string
        # :online - boolean
        # :force  - boolean (qemu)
        def migrate(options = {})
          service.call_migrate_server( service_defaults.merge options )
        end
        
        def spiceproxy
          service.call_spiceproxy_server( service_defaults )
        end
        
        def vncproxy
          service.call_vncproxy_server( service_defaults )
        end
        
        # @param [Hash] options
        # :limit - integer
        # :start - integer
        def initlog(options = {})
          service.call_initlog_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :ds - string
        # :timeframe - enum
        # :cf - enum
        def rrd(options = {})
          service.call_rrd_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :timeframe - enum
        # :cf - enum
        def rrddata(options = {})
          service.call_rrddata_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :feature - enum
        # :snapname - string
        def feature(options = {})
          service.call_feature_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :command - string
        def monitor(options = {})
          service.call_monitor_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :disk - enum
        # :size - string
        # :digest - string
        # :skiplock - boolean
        def resize(options = {})
          service.call_resize_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :key - string
        # :skiplock - boolean
        def sendkey(options = {})
          service.call_sendkey_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :disk - enum
        def create_template(options = {})
          service.call_template_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :idlist - string
        # :force - boolean
        def unlink(options = {})
          service.call_unlink_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :snapname - string
        # :description - string
        # :freezefs - boolean
        # :vmstate - boolean
        def snapshot
          if options.empty?
            service.call_get_snapshots_server( service_defaults )
          else
            service.call_snapshot_server( service_defaults.merge options )
          end
        end

        def config
          options = service_defaults

          data = service.call_get_server_config( options )
          # Decode received attributes for mulitple devices into arrays
          newdata = {}
          data.each{ |a, v|
            as = a.split(/(\d+)/)
            if (ArrayAttributes.include?(as[0].to_sym) and not as[1].nil?)
              newdata[as[0]] ||= []
              newdata[as[0]][as[1].to_i] = v
              data.delete(a)
            end
          }
          merge_attributes(data)
          merge_attributes(newdata)
        end
        
        def stats
          options = service_defaults
          data = service.call_get_server_stats( options )
          merge_attributes( :status => data['status'] ) unless data['status'].nil?
          data
        end
        
        private
        
        def service_defaults
          requires :node
          requires :type
          requires :vmid
          
          {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
          }
        end
        
      end

    end
  end
end
