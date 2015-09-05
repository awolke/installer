#!/bin/sh
# update & upgrade all installed packages
sudo apt-get update
sudo apt-get upgrade

# Install some usefull packages (colordiff,pwgen,rsync,vim)
sudo aptitude -y install colordiff rsync unzip enscript

# Fix potential Environmental Errors by adding below line to /etc/environment
sed -i "1i LC_ALL=C" /etc/environment

# Install Apache / SQL / PHP Support packages
sudo apt-get install apache2 apache2.2-common apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert libapache2-mod-php5 php5 php5-common php5-gd php5-mysql php5-imap  php5-cli php5-cgi libapache2-mod-fcgid apache2-suexec php-pear php-auth php5-curl php5-mcrypt mcrypt libapache2-mod-suphp libruby libapache2-mod-ruby libapache2-mod-python libapache2-mod-perl2 php5-gd php5-idn php-pear php5-imagick php5-memcache php5-mhash php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-json

# Enable the Apache modules suexec
sudo a2enmod suexec rewrite ssl actions include
sudo a2enmod dav_fs dav auth_digest

# For SSL Support
sudo a2enmod ssl
sudo a2ensite default-ssl

# Restart Apache Webserver
sudo /etc/init.d/apache2 restart

# Install Python Stuff
sudo aptitude -y install python-software-properties

# Installing Webmin dependencies
sudo aptitude -y install libnet-ssleay-perl libauthen-pam-perl libio-pty-perl apt-show-versions
sudo aptitude -y install vim-nox

# downloading webmin 1.660 package
cd
sudo wget http://prdownloads.sourceforge.net/webadmin/webmin_1.660_all.deb

# give the installation 30sec time.
sleep 30

# installing webmin package
sudo dpkg --install webmin_1.660_all.deb

# install MySQL
sudo aptitude -y install mysql-server mysql-client

# Restart Apache Webserver
sudo /etc/init.d/apache2 restart

# Install phpMyAdmin
sudo aptitude -y install phpmyadmin


# OPTIONAL
# Install GitLab
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate

# Install Git
sudo apt-get install -y git-core

sudo apt-get install -y postfix

sudo apt-get remove ruby1.8

mkdir /tmp/ruby && cd /tmp/ruby
curl --progress ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.gz | tar xz
cd ruby-2.0.0-p353
./configure --disable-install-rdoc
make
sudo make install

sudo gem install bundler --no-ri --no-rdoc

sudo adduser --disabled-login --gecos 'GitLab' git

# Go to home directory
cd /home/git

# Clone gitlab shell
sudo -u git -H git clone https://gitlab.com/gitlab-org/gitlab-shell.git -b v1.8.0

cd gitlab-shell

sudo -u git -H cp config.yml.example config.yml

# Edit config and replace gitlab_url
# with something like 'http://domain.com/'
sudo -u git -H editor config.yml

# Do setup
sudo -u git -H ./bin/install


# Make sure Git is version 1.7.10 or higher, for example 1.7.12 or 1.8.4
git --version

echo "================================================================================"
echo "==                                                                            =="
echo "== Lazy Installer Completed! Open Webin in your browser: https://ubuntu:10000 ==" 
echo "==                                                                            =="
echo "================================================================================"
exit
