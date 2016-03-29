FROM nginx:alpine

MAINTAINER Paul Beswick

ENV CT_FILE nginx.conf.ctmpl
ENV NX_FILE /etc/nginx/nginx.conf

RUN apk add --update curl jq gettext

ADD nginx.conf /etc/nginx/nginx-template.conf
ADD nginx.conf.ctmpl nginx.conf.ctmpl
ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

CMD ["/bin/sh", "entrypoint.sh"]
