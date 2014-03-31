require 'fog/proxmox/core'
require 'fog/compute'

module Fog
  module Compute
    class Proxmox < Fog::Service

      class BadRequest     < Fog::Errors::Error; end
      class Unauthorized   < Fog::Errors::Error; end
      class ItemNotFound   < Fog::Errors::Error; end
      class NotImplemented < Fog::Errors::Error; end
      
      requires :proxmox_password, :proxmox_username
      recognizes :persistent
      recognizes :host
      recognizes :port
      recognizes :api
      recognizes :scheme
      recognizes :realm
      
      recognizes :proxmox_ticket, :proxmox_csrf, :proxmox_ticket_expiry

      model_path 'fog/proxmox/models/compute'
      # access
      model       :realm
      collection  :realms
      model       :group
      collection  :groups
      model       :role
      collection  :roles
      model       :user
      collection  :users
      # cluster
      model       :resource
      collection  :resources
      model       :backup
      collection  :backups
      model       :hagroup
      collection  :hagroups
      # nodes
      model       :node
      collection  :nodes
      model       :server
      collection  :servers
      model       :log
      collection  :logs
      model       :task
      collection  :tasks
      # storage
      model       :store
      collection  :stores
      # pools
      model       :pool
      collection  :pools
      
      request_path 'fog/proxmox/requests/compute'

      request :call_action_generic
      
      request :call_access_acl
      request :call_access_domain
      request :call_access_domains
      request :call_access_group
      request :call_access_groups
      request :call_access_password
      request :call_access_role
      request :call_access_roles
      request :call_access_ticket
      request :call_access_user
      request :call_access_users
      request :call_access

      request :call_cluster_backup
      request :call_cluster_backups
      request :call_cluster_ha_changes
      request :call_cluster_ha_config
      request :call_cluster_ha_group
      request :call_cluster_ha_groups
      request :call_cluster_ha
      request :call_cluster_log
      request :call_cluster_nextid
      request :call_cluster_options
      request :call_cluster_resources
      request :call_cluster_status
      request :call_cluster_tasks
      request :call_cluster
      
      request :call_node_aplinfo
      request :call_node_apt_changelog
      request :call_node_apt_update
      request :call_node_apt
      request :call_node_bootlog
      request :call_node_ceph_config
      request :call_node_ceph_crush
      request :call_node_ceph_disks
      request :call_node_ceph_init
      request :call_node_ceph_log
      request :call_node_ceph_mon
      request :call_node_ceph_mons
      request :call_node_ceph_osd_in
      request :call_node_ceph_osd_out
      request :call_node_ceph_osd
      request :call_node_ceph_osds
      request :call_node_ceph_pool
      request :call_node_ceph_pools
      request :call_node_ceph_start
      request :call_node_ceph_status
      request :call_node_ceph_stop
      request :call_node_ceph
      request :call_node_dns
      request :call_node_execute
      request :call_node_netstat
      request :call_node_network
      request :call_node_networks
      request :call_node_rrd
      request :call_node_rrddata
      request :call_node_scan_glusterfs
      request :call_node_scan_iscsi
      request :call_node_scan_lvm
      request :call_node_scan_nfs
      request :call_node_scan_usb
      request :call_node_scan
      request :call_node_service_reload
      request :call_node_service_restart
      request :call_node_service_start
      request :call_node_service_state
      request :call_node_service_stop
      request :call_node_service
      request :call_node_services
      request :call_node_spiceshell
      request :call_node_startall
      request :call_node_status
      request :call_node_stopall
      request :call_node_storage_content_volume
      request :call_node_storage_content
      request :call_node_storage_rrd
      request :call_node_storage_rrddata
      request :call_node_storage_status
      request :call_node_storage_upload
      request :call_node_storage
      request :call_node_storages
      request :call_node_subscription
      request :call_node_syslog
      request :call_node_task_log
      request :call_node_task_status
      request :call_node_task
      request :call_node_tasks
      request :call_node_time
      request :call_node_ubcfailcnt
      request :call_node_version
      request :call_node_vncshell
      request :call_node_vzdump
      request :call_node
      request :call_nodes
      
      request :call_pool
      request :call_pools

      request :call_server_clone
      request :call_server_config
      request :call_server_feature
      request :call_server_initlog
      request :call_server_migrate
      request :call_server_monitor
      request :call_server_move_disk
      request :call_server_resize
      request :call_server_rrd
      request :call_server_rrddata
      request :call_server_sendkey
      request :call_server_snapshot_config
      request :call_server_snapshot_rollback
      request :call_server_snapshot
      request :call_server_snapshots
      request :call_server_spiceproxy
      request :call_server_status_current
      request :call_server_status_mount
      request :call_server_status_reset
      request :call_server_status_resume
      request :call_server_status_shutdown
      request :call_server_status_start
      request :call_server_status_stop
      request :call_server_status_suspend
      request :call_server_status_ubc
      request :call_server_status_umount
      request :call_server_template
      request :call_server_unlink
      request :call_server_vncproxy
      request :call_server
      request :call_servers

      request :call_storage
      request :call_storages

      request :call_version

      class Mock

        def self.data
          @data ||= Hash.new do |hash, key|
            hash[key] = {}
          end
        end

        def self.reset
          @data = nil
        end

        def initialize(options={})
          @proxmox_username = options[:proxmox_username]
        end

        def data
          self.class.data[@proxmox_username]
        end

        def reset_data
          self.class.data.delete(@proxmox_username)
        end

      end # Mock

      class Real

        # Initialise connection to proxmox node
        #
        # ==== Notes
        # options parameter must include values for
        #   :proxmox_username
        #   :proxmox_password
        # in order to create a connection
        #
        # ==== Examples
        #   proxmox = Proxmox.new(
        #     :proxmox_username => your_proxmox_username,
        #     :proxmox_password => your_proxmox_password
        #   )
        #
        # ==== Returns
        # * proxmox object with connection
         
        def initialize(options={})
          @proxmox_ticket_expiry = Time::now
          @proxmox_password   = options[:proxmox_password]
          @proxmox_username   = options[:proxmox_username]
          @connection_options = options[:connection_options] || {}
          @persistent         = options[:persistent]         || false
          @host               = options[:host]               || "proxmox"
          @port               = options[:port]               || 8006
          @api                = options[:api]                || '/api2/json'
          @scheme             = options[:scheme]             || 'https'
          @realm              = options[:realm]              || 'pam'

          @connection = Fog::Core::Connection.new(
            "#{@scheme}://#{@host}:#{@port}#{@api}",
            @persistent, @connection_options
          )
        end

        def reload
          @connection.reset
        end

        def request(options)
          command = options[:command] if options.key?(:command)
          filters = options[:filters] if options.key?(:filters)
          method  = options[:method]  if options.key?(:method)
          headers = options[:headers] if options.key?(:headers)

          # Some almost sensible defaults
          command ||= nil
          filters ||= {}
          method  ||= :get
          headers ||= {}
          options.reject!{|k,v| ( v.nil? or [:command, :filters, :method, :headers].include? k ) }

          # Session management
          if has_session?
            headers = auth_session(headers)
          elsif has_credentials?
            headers = auth_credentials(headers)
          end

          headers['CSRFPreventionToken'] = @proxmox_csrf if [:post, :put, :delete].include? method
          headers['Content-Type'] = "application/x-www-form-urlencoded" if [:post, :put].include? method

          puts "DEBUG: command :- #{command.inspect}"
          puts "DEBUG: filters :- #{filters.inspect}"
          puts "DEBUG: method :- #{method.inspect}"
          puts "DEBUG: headers :- #{headers.inspect}"
          puts "DEBUG: options :- #{options.inspect}"
          
          response = issue_request(command, options, headers, method)
          response = Fog::JSON.decode(response.body)['data'] unless response.body.empty?

          # Filter response items
          response.select! { |r|
            match = true
            filters.each_pair{ |k,v|
              if r.key? k.to_s
                if v.is_a? Array
                  match = ( v.include? r[k.to_s] )
                else
                  match = ( r[k.to_s] == v )
                end
                break unless match
              end
            }
            match
          } unless ( filters.nil? or filters.empty? )

          response
        end
        
        private

        def has_session?
          @proxmox_csrf = nil if Time::now > @proxmox_ticket_expiry
          @proxmox_ticket && @proxmox_csrf
        end
        
        def has_credentials?
          @proxmox_username && @proxmox_password
        end
        
        def auth_session(headers)
          # Set the ticket for the request
          headers.merge!( 'Cookie' => "PVEAuthCookie=" + @proxmox_ticket )
          
          return headers
        end
        
        def auth_credentials(headers)
          # Will get a new ticket
          response = issue_request(
            'access/ticket',
            {
              'username' => @proxmox_username,
              'password' => @proxmox_password,
              'realm'    => @realm
            },
            {},
            'POST'
          )

          # Decode the login response
          response = Fog::JSON.decode(response.body)['data']

          @proxmox_ticket  = response['ticket']
          @proxmox_csrf = response['CSRFPreventionToken']
          @proxmox_username = response['username']
          @proxmox_ticket_expiry = Time::now + (120 * 60)

          headers.merge!( 'Cookie' => "PVEAuthCookie=" + @proxmox_ticket )

          return headers
        end

        def issue_request(command, params={},headers={},method='GET',expects=200)
          begin
            @connection.request({
              :path => "#{@api}/#{command}",
              :query => params,
              :headers => headers,
              :method => method,
              :expects => expects  
            })

          rescue Excon::Errors::HTTPStatusError => error
            error_code = error.response.status
            error_response = Fog::JSON.decode(error.response.body)
            error_text = error_response['errors'] unless error_response['errors'].nil?

            case error_code
              when 500
                raise Fog::Compute::Proxmox::ItemNotFound, error_text
              when 501
                raise Fog::Compute::Proxmox::NotImplemented, error_text
              when 401
                raise Fog::Compute::Proxmox::Unauthorized, error_text
              when 431
                raise Fog::Compute::Proxmox::BadRequest, error_text
              else
                raise Fog::Errors::Error, "#{error_code}: #{error_text}"
            end
          end

        end
        
      end # Real

    end
  end
end
