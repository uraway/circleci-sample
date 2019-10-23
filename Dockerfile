FROM php:7.3.10

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get update \
    && apt-get install -y nodejs git libzip-dev zip unzip

RUN docker-php-ext-install pdo_mysql

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');"

RUN mv composer.phar /usr/local/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER=1

ENV APP_ROOT /project

WORKDIR $APP_ROOT

COPY src/ $APP_ROOT

RUN composer install -n --prefer-dist

RUN npm install
