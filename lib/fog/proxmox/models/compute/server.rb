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
            service.create_server( options )
          else
            service.update_server( options )
          end
        end
        
        # @param [Hash] options
        # :skiplock - boolean (qemu)
        def destroy(options = {})
          service.delete_server( service_defaults.merge options )
        end

        # @param [Hash] options
        # :skiplock - boolean (qemu)
        def reset(options = {})
          service.reset_server( service_defaults.merge options )
        end

        # @param [Hash] options
        # :skiplock - boolean (qemu)
        def resume(options = {})
          service.resume_server( service_defaults.merge options )
        end

        # @param [Hash] options
        # :forceStop - boolean
        # :keepActive - boolean (qemu)
        # :skiplock - boolean (qemu)
        # :timeout - integer
        def shutdown(options = {})
          service.shutdown_server( service_defaults.merge options )
        end

        # @param [Hash] options
        # :migratedfrom - string (qemu)
        # :skiplock - boolean (qemu)
        # :stateuri - string (qemu)
        def start(options = {})
          service.start_server( service_defaults.merge options )
        end

        # @param [Hash] options
        # :keepActive - boolean (qemu)
        # :migratedfrom - string (qemu)
        # :skiplock - boolean (qemu)
        # :timeout - integer (qemu)
        def stop(options = {})
          service.stop_server( service_defaults.merge options )
        end

        def ubc
          service.ubc_server( service_defaults )
        end

        # @param [Hash] options
        # :skiplock - boolean (qemu)
        def suspend(options = {})
          service.suspend_server( service_defaults.merge options )
        end

        def mount
          service.mount_server( service_defaults )
        end

        def umount
          service.umount_server( service_defaults )
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
          service.clone_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :target - string
        # :online - boolean
        # :force  - boolean (qemu)
        def migrate(options = {})
          service.migrate_server( service_defaults.merge options )
        end
        
        def spiceproxy
          service.spiceproxy_server( service_defaults )
        end
        
        def vncproxy
          service.vncproxy_server( service_defaults )
        end
        
        # @param [Hash] options
        # :limit - integer
        # :start - integer
        def initlog(options = {})
          service.initlog_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :ds - string
        # :timeframe - enum
        # :cf - enum
        def rrd(options = {})
          service.rrd_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :timeframe - enum
        # :cf - enum
        def rrddata(options = {})
          service.rrddata_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :feature - enum
        # :snapname - string
        def feature(options = {})
          service.feature_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :command - string
        def monitor(options = {})
          service.monitor_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :disk - enum
        # :size - string
        # :digest - string
        # :skiplock - boolean
        def resize(options = {})
          service.resize_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :key - string
        # :skiplock - boolean
        def sendkey(options = {})
          service.sendkey_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :disk - enum
        def create_template(options = {})
          service.template_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :idlist - string
        # :force - boolean
        def unlink(options = {})
          service.unlink_server( service_defaults.merge options )
        end
        
        # @param [Hash] options
        # :snapname - string
        # :description - string
        # :freezefs - boolean
        # :vmstate - boolean
        def snapshot(options = {})
          service.snapshot_server( service_defaults.merge options )
        end
        def snapshot
          service.get_snapshots_server( service_defaults )
        end

        def config
          options = service_defaults

          data = service.get_server_config( options )
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
          data = service.get_server_stats( options )
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
