module Fog
  module Compute
    class Proxmox
      class Real

        def access( subdir = nil, filters = {}, options = {} ) 
          if filters.empty?
            access_request( subdir, options )
          else
            access_request( subdir, options ).select { |r|
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
              match
            }
          end
        end

        def access_request(subdir = nil, options = {})
          options[:method] ||= 'GET'
          request("access" + "#{"/" + subdir unless subdir.nil?}", options)
        end

      end

      class Mock

        def access
          self.data[:access]
        end

      end
    end
  end
end

