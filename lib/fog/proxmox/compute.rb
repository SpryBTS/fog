require 'fog/proxmox/core'
require 'fog/compute'

module Fog
  module Compute
    class Proxmox < Fog::Service

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
#      model       :realm
#     collection  :realms
#      model       :group
#      collection  :groups
#      model       :role
#      collection  :roles
#     model       :user
#      collection  :users
      # cluster
      model       :resource
      collection  :resources
#      model       :backup
#      collection  :backups
#      model       :hagroup
#      collection  :hagroups
      # nodes
      model       :openvz
      collection  :openvzs
#      model       :qemu
#      collection  :qemus
      model       :server
      collection  :servers
#      model       :service
#      collection  :services
#      model       :network
#      collection  :networks
#      model       :scan
#      collection  :scans
#      model       :task
#      collection  :tasks
      # storage
#      model       :store
#      collection  :stores
      # pools
#      model       :pool
#      collection  :pools
      
      request_path 'fog/proxmox/requests/compute'

#      request     :access
#      request     :access_domains
#      request     :access_groups
#      request     :access_roles
#      request     :access_users
      request     :cluster
#      request     :cluster_backup
#      request     :cluster_ha
#      request     :cluster_ha_groups
      request     :nodes
#      request     :nodes_network
      request     :nodes_openvz
      request     :nodes_openvz_status
#      request     :nodes_qemu
#      request     :nodes_qemu_snapshot
#      request     :nodes_scan
#      request     :nodes_services
#      request     :nodes_storage
#      request     :nodes_storage_content
#      request     :pools
#      request     :storage
#      request     :version
      
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

          @connection = Fog::Connection.new(
            "#{@scheme}://#{@host}:#{@port}#{@api}",
            @persistent, @connection_options
          )
        end

        def reload
          @connection.reset
        end

        def request(command, params)
          headers = {}
          method = 'GET'
          params.reject!{|k,v| v.nil?}

          if has_session?
            headers = auth_session(headers)
          elsif has_credentials?
            headers = auth_credentials(headers)
          end

          if params.key?(:method)
            method = params[:method]
            params.delete(:method)
          end
          headers['CSRFPreventionToken'] = @proxmox_crsf if %w(POST PUT DELETE).include? method

          response = issue_request(command, params, headers, method)
          response = Fog::JSON.decode(response.body)['data'] unless response.body.empty?
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
          # Will get a new ticket, if an old ticket exists, we use that as password for renewal
          response = issue_request(
            'access/ticket',
            {
              'username' => @proxmox_username,
              'password' => @proxmox_ticket || @proxmox_password,
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
            error_response = Fog::JSON.decode(error.response.body)

            error_code = error_response.values.first['errorcode']
            error_text = error_response.values.first['errortext']

            case error_code
              when 401
                raise Fog::Compute::Cloudstack::Unauthorized, "(#{error_code})".error_text
              when 431
                raise Fog::Compute::Cloudstack::BadRequest, "(#{error_code})".error_text
              else
                raise Fog::Compute::Cloudstack::Error, "(#{error_code})".error_text
            end
          end

        end
        
      end # Real

    end
  end
end
