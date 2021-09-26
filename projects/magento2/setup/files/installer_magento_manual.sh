#!/usr/bin/env bash

set -e

cd ~

mkdir tmp

(
  cd tmp

  cp ../files/magento.tar.gz .

  tar -xf magento.tar.gz

  rm magento.tar.gz
)

sudo rm -rf /var/www/html
sudo mv tmp /var/www/html
sudo chown -R www-data:www-data /var/www/html

echo "creating database"
sudo mysql --execute "create DATABASE magento"
sudo mysql --execute "GRANT ALL PRIVILEGES ON *.* TO 'magento'@'localhost' IDENTIFIED BY 'magento'"

echo "updating apache2 config"
sudo sed -i 's|AllowOverride None|AllowOverride All|' /etc/apache2/apache2.conf
sudo a2enmod rewrite
sudo service apache2 restart

echo "installing PHP PEAR"
wget http://pear.php.net/go-pear.phar
php go-pear.phar
rm go-pear.phar

echo "installing xdebug"
sudo pecl install xdebug

XDEBUG_FILE_PATH=$( (sudo find / -type f -name xdebug.so 2>&1) | grep -v Permission)
APACHE_PHPINI_PATH=$( (sudo find / -type f -name php.ini 2>&1) | grep -v Permission | grep apache)

echo "adding /var/www/html/php_info.php file"
echo '<?php phpinfo();' | sudo tee /var/www/html/php_info.php
echo "configuring $APACHE_PHPINI_PATH"
echo 'zend_extension="'"$XDEBUG_FILE_PATH"'"' | sudo tee -a "$APACHE_PHPINI_PATH"

echo 'xdebug.remote_port=5050' | sudo tee -a "$APACHE_PHPINI_PATH"
echo 'xdebug.remote_enable=1' | sudo tee -a "$APACHE_PHPINI_PATH"
echo 'xdebug.remote_autostart=1' | sudo tee -a "$APACHE_PHPINI_PATH"
sudo service apache2 restart

echo "configuring xdebug debugclient"
git clone git clone git://github.com/xdebug/xdebug.git
(
  cd xdebug
  rm -rf .git
  cd debugclient
  ./buildconf
  ./configure
  make
  sudo mv debugclient /usr/bin
)

rm -rf xdebug

echo "magento installation completed successfully"
