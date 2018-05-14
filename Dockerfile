# please do the mapping for xdebug : sudo ifconfig lo0 alias 10.254.254.254
FROM php:5.6-apache

RUN apt-get update && apt-get install -y wget libpq-dev git libzip-dev && apt-get clean
RUN apt-get install openssl build-essential libssl-dev libxrender-dev git-core libx11-dev libxext-dev libfontconfig1-dev libfreetype6-dev fontconfig -y
RUN apt-get install -y libqt4-dev qt4-dev-tools
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar vxf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN cp wkhtmltox/bin/wk* /usr/local/bin/


RUN docker-php-ext-install pdo pdo_mysql zip mysqli


# RUN wget https://phar.phpunit.de/phpunit-5.7.phar && chmod +x phpunit-5.7.phar && mv phpunit-5.7.phar /usr/bin/phpunit

# RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');"

RUN a2enmod rewrite

RUN service apache2 restart

docker pull serdaraydogan/docker-hub-test