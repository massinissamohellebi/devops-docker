FROM ubuntu:latest

#Installer quelques packagings
RUN apt-get update \
    && DEBIAN_FRONTEND=nointeractive apt-get install -y build-essential gperf \
    software-properties-common apt-utils language-pack-en-base \
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/*

#Installer PHP PPA
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

#Installer Apache, Mysql, PHP, as well as other stuff
RUN apt-get update \
    && DEBIAN_FRONTEND=nointeractive apt-get install -y apt-utils vim curl memcached \
    zip imagemagick mysql-server php7.1 php7.1-soap php7.1-curl php7.1-mcrypt \
    php7.1-gd php-imagick php7.1-json php7.1-xml php7.1-mbstring php-memcached \
    php7.1-mysqli php7.1-mysqlnd php7.1-pdo php7.1-pdo-mysql php-xdebug \
    apache2 libapache2-mod-php7.1\
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/*

#Configurer Apache
RUN a2enmod setenvif rewrite php7.1 headers ssl authz_groupfile

#Copie du dossier ou se trouve les sources du projet
COPY ./www/html /var/www/html



#Rajouter les scripts d'execution
ADD mysql-scripts/CreateDatabase.sql /docker-entrypoint-initdb.d/CreateDatabase.sql

ADD mysql-scripts/CreateTable.sql /docker-entrypoint-initdb.d/CreateTable.sql

ADD mysql-scripts/CreateUser.sql /docker-entrypoint-initdb.d/CreateUser.sql

ADD execute.sh /root/execute.sh

#Exposer les Ports
EXPOSE 80/TCP 443/TCP

#Start Command
CMD ["/bin/bash","/root/execute.sh"]
