Vagrant.configure("2") do |kong_lab|
    kong_lab.vm.define "kong" do |kong|
		kong.vm.provider "vmware_desktop" do |v|
			v.cpus = 2
			v.memory = 2048
			v.allowlist_verified = true
		end
        kong.vm.synced_folder ".", "/vagrant"
		kong.vm.box = "generic/rocky8"
		kong.vm.hostname = "kong"
		kong.vm.network "private_network", ip: "192.168.204.156"
		kong.vm.provision "shell", path: "setup.sh"
		end
end