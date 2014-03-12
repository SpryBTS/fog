module Fog
  module Compute
    class Proxmox
      class Real

        require 'set'
        
        OpenVZCreateAttributes = Set.new( [
          :method, :command,
          :ostemplate, :vmid,
          :cpus, :cpuunits, :description, :disk, :force, :hostname, :ip_address, :memory, :nameserver, :netif, :onboot, :password,
          :pool, :quotatime, :quotaugidlimit, :restore, :searchdomain, :storage, :swap
        ] )
        
        QEMUCreateAttributes = Set.new( [
          :method, :command,
          :vmid,
          :acpi, :agent, :archive, :args, :autostart, :ballon, :boot, :bootdisk, :cdrom, :cores, :cpu, :cpulimit, :cpuunits,
          :description, :force, :freeze, :hostpci, :hotplug, :ide, :keyboard, :kvm, :localtime, :lock, :memory,
          :migrate_downtime, :migrate_speed, :name, :net, :onboot, :ostype, :parallel, :pool, :reboot, :sata, :scsi, :scsihw,
          :serial, :shares, :smp, :sockets, :startdate, :startup, :storage, :tablet, :tdf, :template, :unique, :unused,
          :usb, :vga, :virtio, :watchdog
        ] )

        def create_server(options={})
          options.merge!(
            :method => :post,
            :command => "nodes/#{options['node']}/#{options['type']}"
          )
          options.keep_if{ |a| OpenVZCreateAttributes.include? a.to_sym } if options['type'] == 'openvz'
          options.keep_if{ |a| QEMUCreateAttributes.include? a.to_sym } if options['type'] == 'qemu'

          # Burst array attributes to individual components
          Fog::Compute::Proxmox::Server::ArrayAttributes.each { |a|
            unless options[a] == nil
              options[a].each_index { |i| options["#{a}#{i}"] = options[a][i] }
              options.delete( a )
            end
          }
          
          request(options)
        end

      end

      class Mock
        def create_server(options={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
