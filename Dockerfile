FROM php:7.2-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libicu-dev \
        libpq-dev \
        libxslt1-dev \
        libmemcached-dev \
        curl \
        locales \
    && docker-php-ext-install -j$(nproc) iconv mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql intl zip exif
    
## install languages
RUN /usr/sbin/update-locale LANG=C.UTF-8

RUN cat /etc/locale.gen

RUN echo 'de_CH.UTF-8 UTF-8' >> /etc/locale.gen \
	&& locale-gen

RUN echo 'de_DE.UTF-8 UTF-8' >> /etc/locale.gen \
	&& locale-gen

RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
	&& locale-gen

RUN echo 'fr_FR.UTF-8 UTF-8' >> /etc/locale.gen \
	&& locale-gen

RUN echo 'ru_RU.UTF-8 UTF-8' >> /etc/locale.gen \
	&& locale-gen

RUN echo 'it_IT.UTF-8 UTF-8' >> /etc/locale.gen \
	&& locale-gen

RUN echo 'pt_PT.UTF-8 UTF-8' >> /etc/locale.gen \
	&& locale-gen

RUN cat /etc/locale.gen

# Install Memcached for php 7	
RUN curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" \	
    && mkdir -p /usr/src/php/ext/memcached \	
    && tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \	
    && docker-php-ext-configure memcached \	
    && docker-php-ext-install memcached \	
    && rm /tmp/memcached.tar.gz

COPY ./luya.sh /usr/local/bin/luya
COPY ./setup.sh /usr/local/bin/setup
COPY ./custom.ini /usr/local/etc/php/conf.d/custom.ini
RUN chmod +x /usr/local/bin/luya
RUN chmod +x /usr/local/bin/setup
