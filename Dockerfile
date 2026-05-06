# Stage 1: Build
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o hello-bunny main.go

# Stage 2: Final Image
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/hello-bunny .

# Expose the port your app listens on
EXPOSE 8080

# Run the binary
CMD ["./hello-bunny"]
