FROM golang:1.17-alpine

WORKDIR /app

COPY go.mod ./
COPY *.go ./
COPY static ./static

# Build aplikasi
RUN CGO_ENABLED=0 GOOS=linux go build -o /belajar-cicd-pemula

# Set environment variable
ENV PORT 8080

# Command untuk menjalankan aplikasi
CMD ["/belajar-cicd-pemula"]
