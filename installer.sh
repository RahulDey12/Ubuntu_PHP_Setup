#!/bin/sh

# Author: Rahul Dey
# GitHub: https://github.com/RahulDey12

if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

echo "Apache2 & Mysql is Installing..."
apt install apache2 mysql-server -y
a2enmod rewrite

echo "Starting Apache & Mysql"
service apache2 restart
service mysql start

echo "Initializing PHP Installation"
apt-get install software-properties-common -y
add-apt-repository ppa:ondrej/php
apt-get update

echo "PHP 7.3 Modules Installing ..."
apt install php7.3 -y
apt install php7.3-cli php7.3-xml php7.3-mysql php7.3-mbstring php7.3-bcmath php7.3-bz2 php7.3-bcmath php7.3-curl php7.3-gd php7.3-zip php7.3-sqlite3 -y

echo "PHP 7.4 Modules Installing ..."
apt install php7.4 -y
apt install php7.4-cli php7.4-xml php7.4-mysql php7.4-mbstring php7.4-bcmath php7.4-bz2 php7.4-bcmath php7.4-curl php7.4-gd php7.4-zip php7.4-sqlite3 -y

echo "Setting Up Default PHP version to 7.3"
update-alternatives --set php /usr/bin/php7.3
a2dismod php7.4
a2enmod php7.3
service apache2 restart

echo "Composer is Installing..."
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
#Moving Composer From Current Path
mv $(pwd)/composer.phar /usr/bin/composer.phar

echo "PhpMyadmin is Installing..."
apt install phpmyadmin -y

