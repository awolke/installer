# Install Webmin
#
sudo apt-get update
sudo aptitude -y install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python python-software-properties
sudo wget http://sourceforge.net/projects/webadmin/files/webmin/1.760/webmin_1.760_all.deb
sudo dpkg --install webmin_1.760_all.deb
