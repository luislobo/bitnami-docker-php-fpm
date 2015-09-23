FROM bitnami/base-ubuntu:14.04-onbuild
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=php-fpm \
    BITNAMI_APP_USER=bitnami \
    BITNAMI_APP_VERSION=5.5.29-0 \
    BITNAMI_APP_DIR=$BITNAMI_PREFIX/php

ENV BITNAMI_APP_VOL_PREFIX=/bitnami/$BITNAMI_APP_NAME \
    PATH=$BITNAMI_APP_DIR/sbin:$BITNAMI_APP_DIR/bin:$BITNAMI_PREFIX/common/bin:$PATH

RUN sh $BITNAMI_PREFIX/install.sh\
    --php_fpm_allow_all_remote_connections 1 --php_fpm_connection_mode port

COPY rootfs/ /

EXPOSE 9000
VOLUME ["/app", "$BITNAMI_APP_VOL_PREFIX/logs", "$BITNAMI_APP_VOL_PREFIX/conf"]
WORKDIR /app

ENTRYPOINT ["/init"]
