FROM alpine
MAINTAINER Tobias Käfer <tobias@tkaefer.de>

ARG VERSION release/1.0

WORKDIR /Mailpile
VOLUME /root/.local/share/Mailpile
VOLUME /root/.gnupg

# Install requirements
RUN apk add --no-cache git zlib gnupg1 py2-pip \
  openssl py-jinja2 py-libxml2 py-libxslt py-lxml py-pbr py-pillow \
  py-cffi py-cryptography ca-certificates && \
  git clone https://github.com/mailpile/Mailpile.git --branch $VERSION --single-branch --depth=1 && \
  pip install -r requirements.txt && \
  ./mp setup

CMD ./mp --www=0.0.0.0:80 --wait
EXPOSE 80
