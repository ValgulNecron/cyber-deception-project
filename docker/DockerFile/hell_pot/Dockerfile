FROM golang:1.20 AS build
WORKDIR /go/src/app

RUN apt-get update \
 && apt-get install -y git \
 && rm -rf /var/lib/apt/lists/*RUN go mod download

RUN git clone https://github.com/yunginnanet/HellPot.git

WORKDIR HellPot

RUN go mod download

RUN go vet -v ./...
RUN go test -v ./...
RUN \
    CGO_ENABLED=0 \
    VERSION=`git tag --sort=-version:refname | head -n 1` \
    go build -trimpath \
    -ldflags "-s -w -X main.version=$VERSION" \
    cmd/HellPot/*.go


FROM gcr.io/distroless/static-debian11

COPY --from=build /HellPot/go/src/app/HellPot /app
COPY --from=build /HellPot//go/src/app/docker_config.toml /config
EXPOSE 8080
ENTRYPOINT ["/app", "-c", "/config"]