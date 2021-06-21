FROM php:8.0.3-apache
RUN apt-get update
RUN apt-get install -y git vim libzip-dev zip unzip
RUN docker-php-ext-install mysqli pdo pdo_mysql zip
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
COPY 000-default.conf /etc/apache2/sites-available/
RUN a2enmod rewrite
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
