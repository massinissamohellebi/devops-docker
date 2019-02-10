service apache2 start;
service memcached start;
service mysql start;
mysql -u root </docker-entrypoint-initdb.d/CreateDatabase.sql
mysql -u root test </docker-entrypoint-initdb.d/CreateTable.sql
mysql -u root test </docker-entrypoint-initdb.d/CreateUser.sql
rm /var/www/html/index.html
/bin/bash
