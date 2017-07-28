FROM alpine

ENV PUID 100
ENV GUID 101 

# Install needed library
RUN apk add -v --update \
#    supervisor \
    bash \
    zip \
    python \
    py-pip && \
#    mkdir -p /var/log/supervisor && \
    pip install --upgrade awscli s3cmd && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

ENV APP_ROOT /var/www/html

VOLUME $APP_ROOT
WORKDIR $APP_ROOT

# ADD conf/supervisord.conf /etc/supervisord.conf

RUN addgroup -g $GUID nginx
RUN adduser -D -S -h $APP_ROOT -s /sbin/nologin -G nginx -u $PUID nginx

ADD start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/start.sh"]