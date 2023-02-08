sudo dnf clean all ; sudo dnf makecache
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf clean all ; sudo dnf makecache
yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo mkdir -p /etc/containerd
sudo containerd config default > /etc/containerd/config.toml
sudo usermod -aG docker $USER
sudo systemctl restart containerd
sudo systemctl enable containerd
sudo systemctl start docker
sudo systemctl enable docker

sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

sudo yum install node nodejs npm setroubleshoot -y
sudo npm install -g pm2

mkdir -p logs && touch logs/file.log && chmod -R 777 logs

# disable ip v6
sudo sed -i '/GRUB_CMDLINE_LINUX/ s/"$/ ipv6.disable=1"/' /etc/default/grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo reboot