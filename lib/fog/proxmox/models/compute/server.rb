require 'fog/compute/models/server'

module Fog
  module Compute
    class Proxmox

      class Server < Fog::Compute::Server

        identity  :vmid

        # Common attributes
        attribute :node
        attribute :type
        attribute :cpuunits
        attribute :description
        attribute :memory
        attribute :onboot
        attribute :pool
        attribute :storage
        
        # QEMU specific
        attribute :acpi
        attribute :agent
        attribute :archive
        attribute :args
        attribute :autostart
        attribute :balloon
        attribute :boot
        attribute :cdrom
        attribute :cores
        attribute :cpu
        attribute :cpulimit
        attribute :freeze
        attribute :hotplug
        attribute :keyboard
        attribute :kvm
        attribute :localtime
        attribute :lock
        attribute :migrate_downtime
        attribute :migrate_speed
        attribute :name
        attribute :ostype
        attribute :reboot
        attribute :scsihw
        attribute :shares
        attribute :smp
        attribute :sockets
        attribute :startdate
        attribute :startup
        attribute :tablet
        attribute :tdf
        attribute :template
        attribute :unique
        attribute :vga
        attribute :watchdog
        attribute :hostpci
        attribute :ide
        attribute :net
        attribute :parallel
        attribute :sata
        attribute :scsi
        attribute :serial
        attribute :unused
        attribute :usb
        attribute :virtio

        # Openvz specific
        attribute :cpus
        attribute :disk
        attribute :hostname
        attribute :ip_address
        attribute :nameserver
        attribute :netif
        attribute :password
        attribute :quotatime
        attribute :quotaugidlimit
        attribute :searchdomain
        attribute :swap
        
        attr_accessor :loaded
        attr_accessor :skiplock, :newid, :target, :force, :online, :forceStop
        attr_accessor :migratedfrom, :keepActive, :timeout, :snapname, :restore, :delete

        def initialise(attributes={})
          self.loaded = false
          super
        end
        
        def save
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
            'cpuunits' => cpuunits,
            'description' => description,
            'memory' => memory,
            'onboot' => onboot,
            'pool' => pool,
            'storage' => storage,
          }

          case type
            when 'qemu'
              options.merge!( {
                'acpi' => acpi,
                'agent' => agent,
                'archive' => archive,
                'args' => args,
                'autostart' => autostart,
                'balloon' => balloon,
                'boot' => boot,
                'bootdisk' => bootdisk,
                'cdrom' => cdrom,
                'cores' => cores,
                'cpu' => cpu,
                'cpulimit' => cpulimit,
                'delete' => delete,
                'force' => force,
                'freeze' => freeze,
                'hotplug' => hotplug,
                'keyboard' => keyboard,
                'kvm' => kvm,
                'localtime' => localtime,
                'lock' => lock,
                'migrate_downtime' => migrate_downtime,
                'migrate_speed' => migrate_speed,
                'name' => name,
                'ostype' => ostype,
                'reboot' => reboot,
                'scsihw' => scsihw,
                'shares' => shares,
                'skiplock' => skiplock,
                'smp' => smp,
                'sockets' => sockets,
                'startdate' => startdate,
                'startup' => startup,
                'tablet' => tablet,
                'tdf' => tdf,
                'template' => template,
                'unique' => unique,
                'vga' => vga,
                'watchdog' => watchdog,
              } )

              options_array( options, 'hostpci', hostpci )
              options_array( options, 'ide', ide )
              options_array( options, 'net', net )
              options_array( options, 'parallel', parallel )
              options_array( options, 'sata', sata )
              options_array( options, 'scsi', scsi )
              options_array( options, 'serial', serial )
              options_array( options, 'unused', unused )
              options_array( options, 'usb', usb )
              options_array( options, 'virtio', virtio )

            when 'openvz'
              requires :ostemplate
              
              options.merge!( {
                'cpus' => cpus,
                'disk' => disk,
                'force' => force,
                'hostname' => hostname,
                'ip_address' => ip_address,
                'nameserver' => nameserver,
                'netif' => netif,
                'password' => password,
                'quotatime' => quotatime,
                'quotaugidlimit' => quotaugidlimit,
                'restore' => restore,
                'searchdomain' => searchdomain,
                'swap' => swap,
              } )
          end
          
          if self.loaded then
            options['digest'] = digest
            service.update_server( options )
          else
            service.create_server( options )
          end
        end
        
        def destroy
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'vmid' => vmid,
            'skiplock' => skiplock,
          }

          service.delete_server( options )
        end

        def reset
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
            'skiplock' => skiplock,
          }
          service reset_server( options )
        end

        def resume
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
            'skiplock' => skiplock,
          }
          service resume_server( options )
        end

        def shutdown
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
            'forceStop' => forceStop,
            'keepActive' => keepActive,
            'skiplock' => skiplock,
            'timeout' => timeout,
          }
          service shutdown_server( options )
        end

        def start
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
          }
          options.merge!( {
            'migratedfrom' => migratedfrom,
            'skiplock' => skiplock,
            'timeout' => timeout,
          } ) if type == 'qemu'
          service start_server( options )
        end

        def stop
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
          }
          options.merge!( {
            'keepActive' => keepActive,
            'migratedfrom' => migratedfrom,
            'skiplock' => skiplock,
            'timeout' => timeout,
            } ) if type == 'qemu'
          service stop_server( options )
        end

        def ubc
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
          }
          service ubc_server( options )
        end

        def suspend
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
            'skiplock' => skiplock,
          }
          service suspend_server( options )
        end

        def mount
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
            'skiplock' => skiplock,
          }
          service mount_server( options )
        end

        def umount
          requires :node
          requires :type
          requires :vmid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
          }
          service umount_server( options )
        end

        def clone
          requires :node
          requires :type
          requires :vmid
          requires :newid
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
            'newid' => newid,
            'description' => description,
            'format' => format,
            'full' => full,
            'name' => name,
            'pool' => pool,
            'snapname' => snapname,
            'storage' => storage,
            'target' => target,
          }
          service.clone_server( options )
        end
        
        def migrate
          requires :node
          requires :type
          requires :vmid
          requires :target
          
          options = {
            'node' => node,
            'type' => type,
            'vmid' => vmid,
            'target' => target,
            'force' => force,
            'online' => online,
          }
          service.migrate_server( options )
        end
        
        private
        
        def options_array( options, prefix, source )

          count = 0
          source.each { |v|
            options[prefix + count.to_s] = v
            count += 1
          } unless source.nil?
          options
        end
        
      end

    end
  end
end
