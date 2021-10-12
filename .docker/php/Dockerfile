FROM php:7.3-fpm-alpine

RUN docker-php-ext-install mbstring pdo_mysql bcmath mysqli
RUN docker-php-ext-enable mysqli

RUN apk add --update bzip2-dev
#RUN docker-php-ext-install php-soap && \
#    docker-php-ext-install soap

RUN apk update && apk add --no-cache gcc libffi-dev g++ build-base linux-headers postgresql-dev postgresql-contrib pcre-dev bash alpine-sdk jpeg-dev zlib-dev libzip-dev libpng-dev

RUN docker-php-ext-install zip

RUN docker-php-ext-install gd

RUN apk add --no-cache \
		$PHPIZE_DEPS \
		openssl-dev
RUN apk add libmcrypt-dev
RUN pecl install mcrypt-1.0.2 && \
    docker-php-ext-enable mcrypt

RUN apk add gcc libffi-dev g++ unixodbc unixodbc-dev \
	&& docker-php-ext-install pdo_mysql \
    && pecl install sqlsrv pdo_sqlsrv \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv

RUN pecl install xdebug && docker-php-ext-enable xdebug
# COPY ./xdebug.ini /usr/local/etc/php/conf.d/

RUN pecl install redis && docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# RUN apk add curl gnupg

# Download the desired package(s)
# RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.6.1.1-1_amd64.apk
# RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.6.1.1-1_amd64.apk

# Install the package(s)
# RUN apk add --allow-untrusted msodbcsql17_17.6.1.1-1_amd64.apk
# RUN apk add --allow-untrusted mssql-tools_17.6.1.1-1_amd64.apk

RUN apk add icu-dev
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-enable intl

COPY ./php.ini /usr/local/etc/php/
COPY ./docker-php-ext-xdebug.ini /usr/local/etc/conf.d/docker-php-ext-xdebug.ini

RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=VSCODE" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.discover_client_host=true" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
# RUN docker-php-ext-install iconv
# RUN docker-php-ext-enable iconv

# RUN apk add libtool
# RUN apk add gnu-libiconv
# RUN rm /usr/bin/iconv \
#     && curl -SL https://ftp.gnu.org/gnu/libiconv/libiconv-1.16.tar.gz | tar -xz -C . \
#     && cd libiconv-1.16 \
#     && ./configure --prefix=/usr/local \
#     && make \
#     && make install \
#     && libtool --finish /usr/local/lib \
#     && cd .. \
#     && rm -rf libiconv-1.16

# RUN curl -SL https://gitlab.alpinelinux.org/alpine/aports/uploads/19f5148f260a1ac2d1fb3bc790bf2e00/reverse-removal-of-preloadable.patch \
#     | patch -p1 -u
# RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community gnu-libiconv
# ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

# ENV LD_PRELOAD /usr/local/lib/preloadable_libiconv.so
