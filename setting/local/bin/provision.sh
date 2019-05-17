#!/bin/bash -e

# memcachedインストール
yum install  -y  httpd git unzip gcc gcc-c++ libtool memcached
service memcached start

# Remiインストール
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm -O remi-release-7.rpm


# サブドメイン用のディレクトリ作成と設定
#chmod 0705 /home/vagrant
#mkdir /home/vagrant/accounts
#chmod 0777 /home/vagrant/accounts
#chown vagrant:vagrant /home/vagrant/accounts
#cp -af /vagrant/setting/local/001_codeigniter_demo.conf /etc/httpd/conf.d/001_codeigniter_demo.conf

# 諸々インストール
yum -y install epel-release
rpm -Uvh remi-release-7.rpm
yum -y --enablerepo=remi-php72,remi install php php-mbstring php-mcrypt php-xml php-gd php-pecl-apc php-pecl-memcached php-pecl-xdebug

# SSL証明書インストール
yum -y install openssl mod_ssl

# mySQLインストール
yum -y install http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm
yum -y --enablerepo=remi-php72,epel install php-mysqlnd mysql mysql-devel mysql-server
service mysqld start

# libweb,phpMyAdminインストール
yum -y install libwebp
yum -y install --enablerepo=remi-php72,remi phpMyAdmin

# php設定
sed -i -e 's%;date.timezone =%date.timezone = "Asia/Tokyo"%g' /etc/php.ini
sed -i -e 's%;date.timezone =%date.timezone = "Asia/Tokyo"%g' /etc/php.ini

# phpMyAdmin設定
mv /etc/httpd/conf.d/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf.org
cp -af /vagrant/setting/local/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf

# mySQL設定
DB_PASSWORD=$(grep "A temporary password is generated" /var/log/mysqld.log | sed -s 's/.*root@localhost: //')
mysql -uroot -p${DB_PASSWORD} --connect-expired-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'CodeIgniter_2019'; flush privileges;"
mysql -uroot -pCodeIgniter_2019 -e "create database demodb CHARACTER SET utf8mb4;"
cp /etc/my.cnf /etc/my.cnf.org
sed -i -e \$asql_mode=NO_ENGINE_SUBSTITUTION /etc/my.cnf
service mysqld restart

# 諸々設定
#wget https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz
#tar -zxvf libmemcached-1.0.18.tar.gz
#cd libmemcached-1.0.18
#./configure
#make
#make install
#chdir=/usr/local/src
yum -y install --enablerepo=remi-php72 php-devel cyrus-sasl-devel zlib zlib-devel
#wget http://pecl.php.net/get/memcached-3.0.3.tgz
#tar xvzf memcached-3.0.3.tgz
#cd memcached-3.0.3
#phpize
#./configure --with-libmemcached-dir=/usr/local/ --disable-memcached-sasl
#make
#make install
#chdir=/usr/local/src
#systemctl enable memcached
service httpd restart
curl -sS https://getcomposer.org/installer | php
mv -f composer.phar /usr/local/bin/composer
/usr/local/bin/composer install --working-dir /vagrant/
export CI_ENV="development"

# DDL
#cat /vagrant/SQL/DDL.sql |mysql -uroot -pcidemo demodb

# Migration実行
#/usr/bin/php /vagrant/public_html/index.php bin/migrate current
