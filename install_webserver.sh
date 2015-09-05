#!/bin/sh
#========
# update & upgrade 
sudo apt-get update
sudo apt-get upgrade

# Install some usefull packages (colordiff,pwgen,rsync,nano)
aptitude -y install colordiff mlocate ntp pwgen rsync unzip nano enscript

# Install Apache / SQL / PHP Support packages
apt-get install apache2 apache2.2-common apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert libapache2-mod-php5 php5 php5-common php5-gd php5-mysql php5-imap  php5-cli php5-cgi libapache2-mod-fcgid apache2-suexec php-pear php-auth php5-curl php5-mcrypt mcrypt libapache2-mod-suphp libruby libapache2-mod-ruby libapache2-mod-python libapache2-mod-perl2 php5-gd php5-idn php-pear php5-imagick php5-memcache php5-mhash php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-json

# Enable the Apache modules suexec
a2enmod suexec rewrite ssl actions include
a2enmod dav_fs dav auth_digest

# For SSL Support
a2enmod ssl  
a2ensite default-ssl

# Restart Apache Webserver
sudo /etc/init.d/apache2 restart

# Install Python 
sudo apt-get install python-software-properties

# backup /etc/network/interfaces
cp /etc/network/interfaces /etc/network/interfaces.bkp.orig

# re-create and apend some settings to /etc/network/interfaces
rm /etc/network/interfaces
touch /etc/network/interfaces
echo "# This file describes the network interfaces available on your system" >> /etc/network/interfaces
echo "# and how to activate them. For more information, see interfaces(5)." >> /etc/network/interfaces
echo "# The loopback network interface" >> /etc/network/interfaces
echo "auto lo" >> /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo " " >> /etc/network/interfaces
echo "# The primary network interface" >> /etc/network/interfaces
echo "auto eth0" >> /etc/network/interfaces
echo "allow-hotplug eth1" >> /etc/network/interfaces
echo " " >> /etc/network/interfaces
echo "# Setting up all interfaces" >> /etc/network/interfaces
echo "iface eth0 inet dhcp" >> /etc/network/interfaces
echo "iface eth0 inet dhcp" >> /etc/network/interfaces

# Add a line to /etc/rc.local to auto-remove 70-persistent-net.rules at boot
sed -i "13i sudo rm /etc/udev/rules.d/70-persistent-net.rules" /etc/rc.local

# Fix potential Environmental Errors by adding below line to /etc/environment
sed -i "1i LC_ALL=C" /etc/environment 

# Installing Webmin dependencies
aptitude -y libnet-ssleay-perl libauthen-pam-perl libio-pty-perl apt-show-versions

# downloading webmin 1.760 package
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.760_all.deb

# give the installation 20sec time.
sleep 20

# installing webmin package
dpkg --install webmin_1.760_all.deb

echo "================================================================================"
echo "==                                                                            =="
echo "== Lazy Installer Completed! Open Webin in your browser: https://localhost:10000 ==" 
echo "==                                                                            =="
echo "================================================================================"
exit
