FROM alpine
MAINTAINER Tobias Käfer <tobias@tkaefer.de>

ARG VERSION=release/1.0

VOLUME /root/.local/share/Mailpile
VOLUME /root/.gnupg

ENV "MAILPILE_GNUPG" /usr/bin/gpg
ENV "MAILPILE_GNUPG/DM" /usr/bin/dirmngr
ENV "MAILPILE_GNUPG/GA" /usr/bin/gpg-agent
ENV "MAILPILE_OPENSSL" /usr/bin/openssl
ENV "MAILPILE_TOR" /usr/bin/tor

# Install requirements
RUN apk add --no-cache git zlib gnupg py2-pip \
  openssl py-jinja2 py-libxml2 py-libxslt py-lxml py-pbr py-pillow \
  py-cffi py-cryptography ca-certificates tor && \
  git clone https://github.com/mailpile/Mailpile.git --branch $VERSION --single-branch --depth=1 && \
  cd /Mailpile && \
  pip install -r requirements.txt && \
  ./mp setup

WORKDIR /Mailpile

CMD ./mp --www=0.0.0.0:80 --wait
EXPOSE 80
