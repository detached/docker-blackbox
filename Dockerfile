FROM alpine

WORKDIR /tmp

RUN apk add --no-cache make git gnupg bash coreutils findutils
RUN git clone https://github.com/StackExchange/blackbox.git /usr/blackbox \
 && cd /usr/blackbox \
 && make manual-install

CMD ["/bin/bash"]