FROM nginx:alpine

MAINTAINER Paul Beswick

RUN apk add --update curl

CMD ["/bin/sh", "entrypoint.sh"]
