FROM php:5.6-fpm

MAINTAINER fanchen "461670311@qq.com"

COPY ./ext /home/ext

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.aliyun.com/debian stretch main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/debian stretch-proposed-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian stretch main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian stretch-proposed-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list
RUN apt-get clean && apt-get update \
    && apt-get install -y --no-install-recommends \
        libssl-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libicu-dev \
        libldap2-dev \
        libsasl2-dev \
        libmcrypt-dev \
        zlib1g-dev \
        g++ \
    && docker-php-ext-configure iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu --with-ldap-sasl \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure pdo_mysql \
    && docker-php-ext-configure bcmath \
    && docker-php-ext-configure mcrypt \
    && docker-php-ext-configure pcntl \
    && docker-php-ext-install -j$(nproc) gd ldap zip pdo_mysql bcmath mcrypt pcntl\
    && pecl install  \
        /home/ext/intl-3.0.0.tgz \
        /home/ext/redis-4.0.2.tgz \
        /home/ext/mongodb-1.5.2.tgz \
        /home/ext/swoole-1.9.23.tgz \
    && docker-php-ext-enable intl redis mongodb swoole \
    #&& apt-get remove -y --auto-remove curl make gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /home/*;

EXPOSE 9000
CMD ["php-fpm"]