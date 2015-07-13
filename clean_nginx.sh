# Quick auto-installer to setup a Clean Webserver with NGINX
#

# Variables
$USER=www-data

sudo apt-get update
sudo apt-get install nginx -y

# By default, Nginx on Ubuntu 14.04 has one server block enabled by default. 
# It is configured to serve documents out of a directory at:
# /usr/share/nginx/html
# However this script will setup the default website under /var/www/

# to-do: add here variable for website ($arg)
sudo mkdir -p /var/www/candoo/html
sudo chown -R $USER:$USER /var/www
sudo chmod -R 775 /var/www

sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/candoo.io

