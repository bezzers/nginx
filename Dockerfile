FROM nginx:alpine

MAINTAINER Paul Beswick

ADD nginx.conf /etc/nginx/nginx-template.conf
ADD entrypoint.sh
RUN chmod +x entrypoint.sh

CMD ["/bin/sh", "entrypoint.sh"]
