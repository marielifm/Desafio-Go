FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY . .
RUN go build main.go

FROM scratch
WORKDIR /
COPY --from=builder app .
ENTRYPOINT ["/main"]
