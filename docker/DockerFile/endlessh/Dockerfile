FROM alpine:3.9 AS builder
RUN apk add --no-cache build-base
ADD endlessh.c Makefile /
RUN make


FROM alpine:3.9

COPY config /etc/endlessh/config

COPY --from=builder /endlessh /

EXPOSE 2222/tcp

ENTRYPOINT ["/endlessh"]

CMD ["-v"]