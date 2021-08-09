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
COPY ./php.ini /usr/local/etc/php/
# COPY ./xdebug.ini /usr/local/etc/php/conf.d/

RUN pecl install redis
RUN docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# RUN apk add curl gnupg

# Download the desired package(s)
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.6.1.1-1_amd64.apk
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.6.1.1-1_amd64.apk

# Install the package(s)
RUN apk add --allow-untrusted msodbcsql17_17.6.1.1-1_amd64.apk
RUN apk add --allow-untrusted mssql-tools_17.6.1.1-1_amd64.apk
