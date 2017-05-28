# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "100/ubuntu-16.10"

  config.vm.post_up_message = "Ensure Golang is installed with 'go --version"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]

    # Set the CPU count manually.
    cpu_count = 2
    # Adjust cpu count according to the host OS.
    if RUBY_PLATFORM =~ /linux/
      cpu_count = `nproc`.to_i
    elsif RUBY_PLATFORM =~ /darwin/
      cpu_count = `sysctl -n hw.ncpu`.to_i
    end

    # Set cpu count in VirtualBox
    v.customize ["modifyvm", :id, "--cpus", cpu_count]

    # Enable The Intel I/O Advanced Programmable Interrupt Controller (IOAPIC).
    v.customize ["modifyvm", :id, "--ioapic", "on"]

    # Allow host to use VPN and have guest vm resolve dns addresses.
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.provision :shell, inline: <<-SHELL
    apt-get install golang
  SHELL
end
