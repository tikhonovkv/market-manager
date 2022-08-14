FROM spaceonfire/nginx-php-fpm:latest-8.0
RUN apk add nodejs npm

ARG BUILD_ENV

WORKDIR /var/www/html
ENV COMPOSER_VERSION=v2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www/html
COPY nginx.conf /etc/nginx/sites-available/default.conf

RUN npm install

RUN mkdir -p /var/www/html/storage/logs \
        && mkdir -p /var/www/html/storage/framework/cache \
        && chmod -R 777 /var/www/html/storage/framework/cache \
        && chmod -R 777 /var/www/html/storage/logs

# Установите сертификат YandexCloud (MySQL && REDIS)
RUN mkdir .yandex && \
    wget "https://storage.yandexcloud.net/cloud-certs/CA.pem" -O .yandex/root.crt && \
    chmod 0644 .yandex/root.crt

#RUN /usr/bin/crontab /var/www/html/crontab-${BUILD_ENV}.txt
#COPY supervisor-cron.conf /etc/supervisor/conf.d/cron.conf
#COPY supervisor-queue.conf /etc/supervisor/conf.d/queue.conf


RUN COMPOSER_MEMORY_LIMIT=-1 composer install

EXPOSE 80
EXPOSE 5174