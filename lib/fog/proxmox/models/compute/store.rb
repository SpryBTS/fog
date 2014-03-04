require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Store < Fog::Model

        identity  :storage
        
        attribute :authsupported
        attribute :base
        attribute :blocksize
        attribute :content
        attribute :digest
        attribute :disable
        attribute :export
        attribute :format
        attribute :login
        attribute :maxfiles
        attribute :monhost
        attribute :nodes
        attribute :options
        attribute :password
        attribute :path
        attribute :pool
        attribute :portal
        attribute :saferemove
        attribute :server
        attribute :shared
        attribute :ssl
        attribute :target
        attribute :username
        attribute :vgname

        attr_accessor :loaded
        attr_accessor :delete

        def initialise
          self.loaded = false
          super
        end
        
        def save
          requires :storage
          options = {
            'content'    => content,
            'disable'    => disable,
            'format'     => format,
            'maxfiles'   => maxfiles,
            'nodes'      => nodes,
            'options'    => options,
            'pool'       => pool,
            'saferemove' => saferemove,
            'shared'     => shared,
            'ssl'        => ssl,
            'username'   => username,
          }

          if self.loaded then
            options = {
              'delete'     => delete,
              'digest'     => digest,
            }

            service.update_store( options )
          else
            requires :type

            options = {
              'authsupported' => authsupported,
              'base'          => base,
              'blocksize'     => blocksize,
              'export'        => export,
              'login'         => login,
              'monhost'       => monhost,
              'password'      => password,
              'path'          => path,
              'portal'        => portal,
              'server'        => server,
              'target'        => target,
              'vgname'        => vgname,
            }

            service.create_store( options )
          end
          true
        end
        
        def destroy
          requires :storage
          
          options = {
            'storage'     => storage,
          }

          service.delete_store( options )
          true
        end
   
      end

    end
  end
end
