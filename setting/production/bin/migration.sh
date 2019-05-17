# アカウントごとにmigration実行
cat /home/burger/etc/account_list | while read line
do
    account=${line//-/_}
    CI_ENV="production" account_id="${account}" /usr/bin/php /home/burger/system/public_html/index.php bin/migrate current
done
