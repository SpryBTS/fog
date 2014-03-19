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
            service.cluster_backup( options.merge!( :method => :put ) )
          else
            service.cluster_backups( options.merge!( :method => :post ) )
          end
          
          true
        end
        
        def destroy
          requires :id
          
          options = {
            'id' => id,
          }

          service.cluster_backup( options.merge!( :method => :delete ) )
          true
        end
        
      end

    end
    
  end
end
