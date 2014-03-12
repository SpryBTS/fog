module Fog
  module Compute
    class Proxmox
      class Real

        require 'set'
        
        OpenVZUpdateAttributes = Set.new( [
          :method, :command,
          :ostemplate, :vmid,
          :cpus, :cpuunits, :description, :disk, :force, :hostname, :ip_address, :memory, :nameserver, :netif, :onboot, :password,
          :pool, :quotatime, :quotaugidlimit, :restore, :searchdomain, :storage, :swap
        ] )
        
        QEMUUpdateAttributes = Set.new( [
          :method, :command,
          :acpi, :agent, :args, :autostart, :ballon, :boot, :bootdisk, :cdrom, :cores, :cpu, :cpulimit, :cpuunits, :delete,
          :digest, :description, :force, :freeze, :hostpci, :hotplug, :ide, :keyboard, :kvm, :localtime, :lock, :memory,
          :migrate_downtime, :migrate_speed, :name, :net, :onboot, :ostype, :parallel, :reboot, :sata, :scsi, :scsihw,
          :serial, :shares, :skiplock, :smp, :sockets, :startdate, :startup, :tablet, :tdf, :template, :unused,
          :usb, :vga, :virtio, :watchdog
        ] )


        def update_server(options={})
          options.merge!(
            :method => :put,
            :command => "nodes/#{options['node']}/#{options['type']}/#{options['vmid']}/config"
          )
          options.keep_if{ |a| OpenVZUpdateAttributes.include? a.to_sym } if options['type'] == 'openvz'
          options.keep_if{ |a| QEMUUpdateAttributes.include? a.to_sym } if options['type'] == 'qemu'
          
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

          request(options)
        end

      end

      class Mock
        def update_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
