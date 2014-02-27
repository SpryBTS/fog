require 'fog/core/model'

module Fog
  module Compute
    class Proxmox

      class Backup < Fog::Model

        identity  :id

        attribute :all
        attribute :bwlimit
        attribute :compress
        attribute :dow
        attribute :dumpdir
        attribute :exclude
        attribute :exclude_path,  aliases => 'exclude-path'
        attribute :ionice
        attribute :lockwait
        attribute :mailto
        attribute :maxfiles
        attribute :mode
        attribute :node
        attribute :quiet
        attribute :remove
        attribute :script
        attribute :size
        attribute :starttime
        attribute :stdexcludes
        attribute :stopwait
        attribute :storage
        attribute :tmpdir
        attribute :vmid

        attr_accessor :loaded

        def initialise
          self.loaded = false
          super
        end

        def save
          requires :id if self.loaded
          requires :starttime

          options = {
            'id'            => id,
            'all'           => all,
            'bwlimit'       => bwlimit,
            'compress'      => compress,
            'dow'           => dow,
            'dumpdir'       => dumpdir,
            'exclude'       => exclude,
            'exclude-path'  => exclude_path,
            'ionice'        => ionice,
            'lockwait'      => lockwait,
            'mailto'        => mailto,
            'maxfiles'      => maxfiles,
            'mode'          => mode,
            'node'          => node, 
            'quiet'         => quiet,
            'remove'        => remove,
            'script'        => script,
            'size'          => size,
            'starttime'     => starttime,
            'stdexcludes'   => stdexcludes,
            'stopwait'      => stopwait,
            'storage'       => storage,
            'tmpdir'        => tmpdir,
            'vmid'          => vmid,
          }

          if self.loaded then
            service.update_backup( options )
          else
            service.create_backup( options )
          end
          
          true
        end
        
        def destroy
          requires :id
          
          options = {
            'id' => id,
          }

          service.delete_backup( options )
          true
        end
        
      end

    end
    
  end
end
