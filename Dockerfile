FROM alpine AS builder


ARG version=v1.20181219
RUN apk add --no-cache make git
RUN git clone https://github.com/StackExchange/blackbox.git /usr/blackbox \
 && cd /usr/blackbox \
 && git checkout tags/$version \
 && make update

FROM alpine

WORKDIR /tmp
RUN apk add --no-cache gnupg git bash coreutils findutils
COPY --from=builder /usr/blackbox/bin/* /usr/local/bin/
CMD ["/bin/bash"]
