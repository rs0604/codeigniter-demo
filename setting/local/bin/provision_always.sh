#!/bin/bash -e

service httpd start
service mysqld start
export CI_ENV="development"
#/usr/bin/php /vagrant/public_html/index.php bin/migrate current
/usr/local/bin/composer install --working-dir /vagrant/

#httpd再起動
service httpd restart
