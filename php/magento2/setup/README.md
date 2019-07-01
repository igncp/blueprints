- https://magento.com/tech-resources/download
- https://askubuntu.com/a/520635
- https://magento.stackexchange.com/a/135154
- https://www.a2hosting.com/kb/developer-corner/mysql/managing-mysql-databases-and-users-from-the-command-line

## Features

- PHP, MySQL, Apache
- Composer
- PEAR / PECL
- Xdebug

## Install

- Download Magento: https://magento.com/tech-resources/download

```
sh build.sh
sh run.sh

# this is intended to be run manually inside the container
# It needs to have `files/magento.tar.gz`
sh files/installer_magento_manual.sh
```

- Go through the installation wizard. Put `magento` (or `magento@magento.com`) in all values except password.

- Some commands
    - sudo -u www-data php bin/magento setup:static-content:deploy -f
    - sudo -u www-data php bin/magento cache:flush
    - sudo -u www-data php bin/magento indexer:reindex

## Debugging

- https://stackify.com/php-debugging-guide/
- Xdebug (wasn't able to debug yet from outside the Docker container):
    - https://xdebug.org/docs/install
    - https://xdebug.org/docs/remote
    - https://chrome.google.com/webstore/detail/xdebug/nhodjblplijafdpjjfhhanfmchplpfgl?hl=en-GB&gl=GB
