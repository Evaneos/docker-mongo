FROM alpine:3.11 as base

ENV MONGODATA /data/db

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN addgroup -S mongodb && adduser -S mongodb mongodb

RUN apk add --no-cache --virtual .run-deps \
        bash \
        su-exec

ENV GLIBC_VERSION 2.31-r0

RUN set -ex \
    \
    && apk add --no-cache --virtual .fetch-deps \
        ca-certificates \
        curl \
        tar \
    && curl -Lo /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
    && apk add --no-cache --virtual .glibc-deps \
        libgcc \
        libstdc++ \
    && apk add glibc-${GLIBC_VERSION}.apk \
    && apk add glibc-bin-${GLIBC_VERSION}.apk \
    && rm glibc*.apk \
    && /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib \
    && apk del .fetch-deps

VOLUME /data/db

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]

ENV MONGODB_VERSION 3.6.18

FROM base as full

RUN set -ex \
    \
    && apk add --no-cache --virtual .fetch-deps \
        ca-certificates \
        curl \
        tar \
    && mkdir -p /tmp/mongo \
    && curl -Lo mongo.tgz https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-${MONGODB_VERSION}.tgz \
    && curl -fsSL http://downloads.mongodb.org/linux/mongodb-linux-x86_64-${MONGODB_VERSION}.tgz.sha256 | awk '{print $1 " *mongo.tgz"} ' | sha256sum -c - \
    && tar \
        --extract \
        --file mongo.tgz \
        --directory /tmp/mongo \
        --strip-components 1 \
    && rm mongo.tgz \
    && cd /tmp/mongo/bin \
    && mv ./* /usr/local/bin/ \
    && cd / \
    && rm -rf /tmp/mongo \
    && apk del .fetch-deps

FROM base as notools

COPY --from=full /usr/local/bin/mongo /usr/local/bin/mongo
COPY --from=full /usr/local/bin/mongod /usr/local/bin/mongod
