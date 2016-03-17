FROM nginx:alpine

MAINTAINER Paul Beswick

ADD nginx.conf /etc/nginx/nginx.conf

CMD ["/bin/sh", "entrypoint.sh"]
