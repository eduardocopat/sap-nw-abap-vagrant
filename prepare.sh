
# Update and install necessary packages
apt-get update
apt-get install -y uuid* expect tcsh hostname tar net-tools nano iproute2 gzip libaio1 libstdc++6 glibc* dos2unix

# Disable firewall
ufw disable

# Start uuidd services
systemctl start uuidd
/usr/sbin/uuidd

# Enable custom scripts
cd /vagrant
chmod u+x ./NW/install.sh
dos2unix ./NW/install.sh

chmod u+x ./nw_install.sh
dos2unix ./nw_install.sh

chmod +rwx -R ./NW

chmod u+x ./run.sh
dos2unix ./run.sh

chmod u+x ./stop.sh
dos2unix ./stop.sh

#Set the hostname IP in /etc/hosts
cat /etc/hosts | sed "s/127.0.1.1/$(hostname -I|cut -d" " -f 1)/g" > /etc/hosts



