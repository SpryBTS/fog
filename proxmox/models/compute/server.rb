require 'fog/compute/models/server'

module Fog
  module Compute
    class Proxmox

      class Openvz < Fog::Compute::Proxmox

        identity  :ctid

        attribute :node
        attribute :ostemplate
        attribute :vmid
        
        attribute :cpus
        attribute :cpuunits
        attribute :description
        attribute :disk
        attribute :hostname
        attribute :ip_address
        attribute :memory
        attribute :nameserver
        attribute :netif
        attribute :onboot
        attribute :password
        attribute :pool
        attribute :quotatime
        attribute :quotaugidlimit
        attribute :restore
        attribute :searchdomain
        attribute :storage
        attribute :swap

        def save
          requires :ctid
          requires :node
          requires :ostemplate
          raise Fog::Errors::Error.new('Resaving an existing object may create a duplicate') if persisted?
          meta_hash = {}
          create_options = {
            'node' => node,
            'ostemplate' => ostemplate,
            'vmid' => ctid,

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
          data = service.nodes_openvz( {:method => 'POST'}.merge(create_options) )
          reload
        end

        def persisted?
          ctid.nil?
        end

        def start
          data = service.nodes_openvz_status( command = :start, ctid)
        end

        def destroy(options = {})
          data = service.destroy_server(ctid, options)
        end

        def mount(options = {})
          data = service.mount_server(ctid, options)
        end

        def umount(options = {})
          data = service.umount_server(ctid, options)
        end

        def stop(options = {})
          data = service.stop_server(ctid, options)
        end

        def reboot(options = {})
          data = service.restart_server(ctid, options)
        end

        alias_method :restart, :reboot

        def convert(options = {})
          data = service.convert_server(ctid, options)
        end

        def compact(options = {})
          data = service.compact_server(ctid, options)
        end

        def snapshot(options = {})
          data = service.snapshot_server(ctid, options)
        end

        def snapshot_switch(options = {})
          data = service.snapshot_switch_server(ctid, options)
        end

        def snapshot_delete(options = {})
          data = service.snapshot_delete_server(ctid, options)
        end

        def snapshot_mount(options = {})
          data = service.snapshot_mount_server(ctid, options)
        end

        def snapshot_umount(options = {})
          data = service.snapshot_umount_server(ctid, options)
        end

        def snapshot_list(options = {})
          data = service.snapshot_list_server(ctid, options)
        end

        def quotaon(options = {})
          data = service.quotaon_server(ctid, options)
        end

        def quotaoff(options = {})
          data = service.quotaoff_server(ctid, options)
        end

        def quotainit(options = {})
          data = service.quotainit_server(ctid, options)
        end

        def exec(args)
          if args.is_a?(String)
            data = service.exec_server(ctid,[ args ])
          else
            data = service.exec_server(ctid,args)
          end
        end

        def exec2(args)
          if args.is_a?(String)
            data = service.exec2_server(ctid,[ args ])
          else
            data = service.exec2_server(ctid,args)
          end
        end

        def runscript(args)
          if args.is_a?(String)
            data = service.runscript_server(ctid,[ args ])
          else
            data = service.runscript_server(ctid,args)
          end
        end

        def suspend(options = {})
          data = service.suspend_server(ctid, options)
        end

        def resume(options = {})
          data = service.resume_server(ctid, options)
        end


        def set(options)
          data = service.set_server(ctid,options)
        end

        def ready?
          status == 'running'
        end

      end

    end
  end
end
