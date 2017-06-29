FROM alpine:3.5

ENV MONGODB_VERSION 3.4.5

ENV MONGODATA /data/db

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN addgroup -S mongodb && adduser -S mongodb mongodb

RUN set -ex \
    \
    && apk add --no-cache --virtual .fetch-deps \
        ca-certificates \
        curl \
        tar \
    && curl -Lo /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub \
    && curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk \
    && curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-bin-2.23-r3.apk \
    && apk add --no-cache --virtual .glibc-deps \
        libgcc \
        libstdc++ \
    && apk add glibc-2.23-r3.apk \
    && apk add glibc-bin-2.23-r3.apk \
    && rm glibc*.apk \
    && /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib \
    && mkdir -p /tmp/mongo \
    && curl -Lo mongo.tgz https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-${MONGODB_VERSION}.tgz \
    && curl -fsSL http://downloads.mongodb.org/linux/mongodb-linux-x86_64-3.4.5.tgz.sha256 | awk '{print $1 " *mongo.tgz"} ' | sha256sum -c - \
    && tar \
        --extract \
        --file mongo.tgz \
        --directory /tmp/mongo \
        --strip-components 1 \
    && rm mongo.tgz \
    && cd /tmp/mongo/bin \
    && mv mongo mongod /usr/local/bin/ \
    && cd / \
    && rm -rf /tmp/mongo \
    && apk del .fetch-deps \
    && apk add --no-cache --virtual .run-deps \
        bash \
        su-exec

VOLUME /data/db

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]