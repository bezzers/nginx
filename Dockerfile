FROM nginx:alpine

MAINTAINER Paul Beswick

ADD nginx.conf /etc/nginx/nginx-template.conf

CMD ["/bin/sh", "entrypoint.sh"]
