FROM nginx:alpine

MAINTAINER Paul Beswick

RUN apk add --update curl jq gettext

ADD nginx.conf /etc/nginx/nginx-template.conf
ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

CMD ["/bin/sh", "entrypoint.sh"]
