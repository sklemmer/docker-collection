FROM composer:1.8

LABEL maintainer="sklemmer@knet.network"

RUN composer global require laravel/installer

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]
CMD ["laravel"]