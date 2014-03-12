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
      # ACL access is a bit hard to model, requests should suffice.
      # There is really no unique identity for each ACL.
#      model       :acl
#      collection  :acls
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

      request :action_generic
      
      request :create_acl
      request :list_acls

      request :create_backup
      request :delete_backup
      request :update_backup
      request :list_backups

      request :create_group
      request :delete_group
      request :update_group
      request :list_groups

      request :pools_get
      request :pools_post
      request :pools_pool_get
      request :pools_pool_put
      request :pools_pool_delete

      request :create_realm
      request :delete_realm
      request :update_realm
      request :list_realms

      request :create_role
      request :delete_role
      request :update_role
      request :list_roles

      request :create_user
      request :delete_user
      request :update_user
      request :list_users
      
      request :create_hagroup
      request :delete_hagroup
      request :update_hagroup
      request :list_hagroups

      request :server_clone_post
      request :server_config_get
      request :server_config_post
      request :server_config_put
      request :server_delete
      request :server_feature_get
      request :server_get
      request :server_initlog
      request :server_migrate_post
      request :server_monitor_post
      request :server_move_disk_post
      request :server_resize_put
      request :server_rrd_get
      request :server_rrddata_get
      request :server_sendkey_put
      request :server_snapshots_get
      request :server_snapshots_post
      request :server_snapshots_snapshot_config_get
      request :server_snapshots_snapshot_config_put
      request :server_snapshots_snapshot_delete
      request :server_snapshots_snapshot_get
      request :server_snapshots_snapshot_rollback_post
      request :server_spiceproxy_post
      request :server_status_current_get
      request :server_status_mount_post
      request :server_status_reset_post
      request :server_status_resume_post
      request :server_status_shutdown_post
      request :server_status_start_post
      request :server_status_stop_post
      request :server_status_suspend_post
      request :server_status_ubc_get
      request :server_status_umount_post
      request :server_template_post
      request :server_unlink_put
      request :server_vncproxy_post
      request :servers_get
      request :servers_post

      request :nodes_get
      request :node_aplinfo_get
      request :node_aplinfo_post
      request :node_bootlog_get
      request :node_dns_get
      request :node_dns_post
      request :node_execute_post
      request :node_get
      request :node_netstat_get
      request :node_rrd_get
      request :node_rrddata_get
      request :node_spiceshell_post
      request :node_startall_post
      request :node_status_get
      request :node_status_post
      request :node_stopall_post
      request :node_subscription_get
      request :node_subscription_post
      request :node_subscription_put
      request :node_syslog_get
      request :node_time_get
      request :node_time_put
      request :node_ubcfailcnt_get
      request :node_version_get
      request :node_vncshell_post
      request :node_vzdump_post
      
      request :create_store
      request :delete_store
      request :update_store
      request :list_stores

      request :list_logs
      request :list_resources
      request :list_tasks

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
          puts "DEBUG: "
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
            puts "DEBUG error.repsonse: #{error.response.inspect}"
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
