module Fog
  module Compute
    class Proxmox
      class Real

        def cluster( command = 'resources', filters = {}, options = {} ) 
          if ( filters.empty? and command != 'resources' )
            cluster_get( command, options )
          else
            cluster_get( command, options ).select { |r|
              match = true
              filters.each_pair{ |k,v|
                if r.key? k
                  case v
                    when Array
                      match = false if not v.include? r[k]
                    when String 
                      match = false if r[k] != v
                  end
                  break unless match
                end
              }
              if ( match && command == 'resources' )
                # Reformat the returned 'id' value
                r['id'].gsub!(/^\/?#{r['type']}\//,'')
              end
              match
            }
          end
        end

        # Probably be good to cache this locally at some point
        def cluster_get(command = 'resources', options = {})
          options[:method] ||= 'GET'
          request("cluster/#{command}", options)
        end

      end

      class Mock

        def cluster_resources
          self.data[:resources]
        end

      end
    end
  end
end
