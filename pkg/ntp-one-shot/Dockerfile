FROM linuxkit/alpine:5fd4e83fea8bd04f21d1611d04c93d6ccaca785a AS mirror

RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk/
RUN apk add --no-cache --initdb -p /out \
    alpine-baselayout \
    busybox \
    musl \
    && true
RUN rm -rf /out/etc/apk /out/lib/apk /out/var/cache

FROM scratch
ENTRYPOINT []
CMD []
WORKDIR /
COPY --from=mirror /out/ /
CMD ["ntpd", "-d", "-n", "-q", "-p", "pool.ntp.org"]
