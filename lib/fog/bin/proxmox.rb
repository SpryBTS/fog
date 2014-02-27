class Proxmox < Fog::Bin
  class << self

    def class_for(key)
      case key
      when :compute
        Fog::Compute::Proxmox
      else
        raise ArgumentError, "Unsupported #{self} service: #{key}"
      end
    end

    def [](service)
      @@connections ||= Hash.new do |hash, key|
        hash[key] = case key
        when :compute
          Fog::Logger.warning("Proxmox[:compute] is not recommended, use Compute[:proxmox] for portability")
          Fog::Compute.new(:provider => 'Proxmox')
        else
          raise ArgumentError, "Unrecognized service: #{key.inspect}"
        end
      end
      @@connections[service]
    end

    def services
      Fog::Proxmox.services
    end

  end
end
