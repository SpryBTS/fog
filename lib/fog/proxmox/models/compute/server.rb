require 'fog/compute/models/server'

module Fog
  module Compute
    class Proxmox

      class Server < Fog::Compute::Server

        ArrayAttributes = %w[ hostpci ide net parallel sata scsi unused usb virtio ]
        
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
        attr_accessor :skiplock, :forceStop
        attr_accessor :migratedfrom, :keepActive, :timeout, :snapname, :restore, :delete

        def initialise(attributes={})
          self.loaded = false
          super
        end
        
        def save
          options = service_defaults
          options.merge!({
            'node' => node,
            'type' => type,
            'vmid' => vmid,
            'cpuunits' => cpuunits,
            'description' => description,
            'memory' => memory,
            'onboot' => onboot,
            'pool' => pool,
            'storage' => storage,
          })

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

              ArrayAttributes.each { |a|
                count = 0
                eval(a).each { |v|
                  options[a + count.to_s] = v
                  count += 1
                } unless eval(a).nil?
              }

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
        
        def destroy(options = {})
          options = service_defaults
          options.merge!( 'skiplock' => skiplock )

          service.delete_server( options )
        end

        def reset(options = {})
          options = service_defaults
          options.merge!( 'skiplock' => skiplock )

          service reset_server( options )
        end

        def resume(options = {})
          options = service_defaults
          options.merge!( 'skiplock' => skiplock )

          service.resume_server( options )
        end

        def shutdown(options = {})
          options = service_defaults
          options.merge!( {
            'forceStop' => forceStop,
            'keepActive' => keepActive,
            'skiplock' => skiplock,
            'timeout' => timeout,
          } )

          service.shutdown_server( options )
        end

        def start(options = {})
          options = service_defaults
          options.merge!( {
            'migratedfrom' => migratedfrom,
            'skiplock' => skiplock,
            'timeout' => timeout,
          } ) if type == 'qemu'
          service.start_server( options )
        end

        # @param [Hash] options
        # :keepActive - boolean
        # :migratedfrom - 
        # :skiplock - boolean
        def stop(options = {})
          options.merge! service_defaults
          options.merge!( {
            'keepActive' => keepActive,
            'migratedfrom' => migratedfrom,
            'skiplock' => skiplock,
            'timeout' => timeout,
            } ) if type == 'qemu'
          service.stop_server( options )
        end

        def ubc
          options = service_defaults
          serviceubc_server( options )
        end

        # @param [Hash] options
        # :skiplock - boolean
        def suspend(options = {})
          options.merge! service_defaults
          service.suspend_server( options )
        end

        # @param [Hash] options
        # :skiplock - boolean
        def mount(options = {})
          options.merge! service_defaults
          service.mount_server( options )
        end

        def umount
          options = service_defaults
          service.umount_server( options )
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
          options.merge! service_defaults
          service.clone_server( options )
        end
        
        # @param [Hash] options
        # :target - string
        # :online - boolean
        # :force  - boolean
        def migrate(options = {})
          options.merge! service_defaults
          service.migrate_server( options )
        end
        
        def config
          options = service_defaults

          data = service.get_server_config( options )
          # Decode received attributes for mulitple devices into arrays
          newdata = {}
          data.each{ |a, v|
            as = a.split(/(\d+)/)
            if (ArrayAttributes.include?(as[0]) and not as[1].nil?)
              newdata[as[0]] ||= []
              newdata[as[0]][as[1].to_i] = v
              data[a] = nil
            end
          }
          merge_attributes(data)
          merge_attributes(newdata)
        end
        
        def current_status
          options = service_defaults
          data = service.get_server_status( options )
          merge_attributes( :status => data['status'] ) unless data['status'].nil?
          data['status']
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
