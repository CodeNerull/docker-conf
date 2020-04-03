FROM php:7.2-fpm

MAINTAINER fanchen "461670311@qq.com"

COPY ./ext /home/ext

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        libssl-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libicu-dev \
        libldap2-dev \
        libsasl2-dev \
        zlib1g-dev \
        g++ \
    && docker-php-ext-configure iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu --with-ldap-sasl \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure pdo_mysql \
    && docker-php-ext-configure bcmath \
    && docker-php-ext-configure pcntl \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) gd ldap zip pdo_mysql bcmath pcntl intl\
    && pecl install  \
        /home/ext/redis-4.0.2.tgz \
        /home/ext/mongodb-1.5.2.tgz \
        /home/ext/swoole-4.3.0.tgz \
    && docker-php-ext-enable redis mongodb swoole \
    #&& apt-get remove -y --auto-remove curl make gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /home/*;

EXPOSE 9000
CMD ["php-fpm"]
