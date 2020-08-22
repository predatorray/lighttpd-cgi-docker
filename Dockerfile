FROM bash:4.4

RUN set -ex && \
    apk add --no-cache lighttpd && \
    rm -rf /var/log/lighttpd /etc/lighttpd /var/www && \
    mkdir -p /var/www/cgi-bin

COPY lighttpd.conf /etc/lighttpd/
COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
