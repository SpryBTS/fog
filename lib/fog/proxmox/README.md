# Description
The proxmox provider implements a simple mapping between proxmox api and fog

# Usage
## Establish a connection
    proxmox = ::Fog::Compute.new( {:provider => 'proxmox'})

## List servers

    proxmox = ::Fog::Compute.new( {:provider => 'proxmox'})
    servers = proxmox.servers.all
    servers.each do |s|
      puts c.ctid
    end

## Server Unique id
Servers have the ctid as identity.

## Get a specific server

    proxmox = ::Fog::Compute.new( {:provider => 'proxmox'})
    server = proxmox.servers.get(104)

## Server lifecycle

    proxmox = ::Fog::Compute.new( {:provider => 'proxmox'})
    # Create a server
    server = proxmox.servers.create(
      :ctid       => '104',
      :ostemplate => 'ubuntu-12.04-x86_64',
      :diskspace  => 1024*1024 #in kbyte
    )
    server.reload

    # Start a server
    unless server.status == 'running'
      server.start
    end

    server.set({
      :nameserver => '8.8.8.8',
      :ipadd => '192.168.8.10',
      :ram => '380M',
      :hostname => 'wonderfullserver',
      :name => 'chef',
      :description => 'wonderfullserver',
      :save => true
    })

    # Reboot a server
    server.reboot
    sleep 3

    # Get the ipaddress
    puts "ipaddress: #{server.public_ip_address}"

    server.wait_for { status == 'running' }

    # Stop the server
    server.stop

    # Destroy the server
    server.destroy

## Models
Both compute::server and computer::servers (collections) have been implemented

Note:
- server.save can only be called upon creation, use the server.set command to change the settings
- server.public_ip_address will only return the first ip address
- TODO: snapshots could be implemented as a collection
- server.state has the standard proxmox states.
- server.ready? assumes server.status == 'running'

## Requests
### Passing parameters
The server request are in essence a passthrough to __vzctl__.
Just provide the options as a hash in key,value pairs. 
If it's just a switch (like --save), use a key and a boolean(true).

The following command in plain cli-vzctl:

    vzctl set 104 --nameserver 8.8.8.8 --ipadd 192.168.8.10 --ram '380M'

Would be in fog-speak:

    server = proxmox.servers.get(104)
    server.set({
      :nameserver => '8.8.8.8',
      :ipadd      => '192.168.8.10',
      :ram        => '380M',
      :save       => true
    })

To specify multiple values for the same option pass an array

    server.set({
      :nameserver => ['8.8.8.8','7.7.7.7'],
      :ipadd      => ['192.168.8.10','192.168.4.10'],
      :ram        => '380M',
      :save       => true
    })

### Not implemented

## API commands

the current version of the fog proxmox driver is based (and tested) on api version:

{
  "repoid":"060bd5a6",
  "version":"3.1",
  "release":"24"
}

