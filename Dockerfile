# Start with a base Go image
FROM golang:1.22-alpine AS builder

# Set environment variables
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Install dependencies
RUN apk update && apk add --no-cache git

# Create and set the working directory
WORKDIR /app

# Copy go.mod and go.sum
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the Go application
RUN go build -o guardian-daemon .

# Start a new minimal image for the final container
FROM alpine:latest

# Set working directory
WORKDIR /root/

# Copy the compiled binary from the builder
COPY --from=builder /app/guardian-daemon .

# Copy the .env file into the container
COPY .env .env

# Expose any ports if necessary (e.g., 1883 if your app uses it)
# EXPOSE 1883

# Run the Go application
CMD ["./guardian-daemon"]
