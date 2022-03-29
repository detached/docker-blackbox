FROM alpine AS builder


ARG commit=7715254169c62267313d163c48f5c9d290370c65
RUN apk add --no-cache make git
RUN git clone https://github.com/StackExchange/blackbox.git /usr/blackbox \
 && cd /usr/blackbox \
 && git checkout $commit \
 && make update

FROM alpine

WORKDIR /tmp
RUN apk add --no-cache gnupg git bash coreutils findutils
COPY --from=builder /usr/blackbox/bin/* /usr/local/bin/
CMD ["/bin/bash"]
