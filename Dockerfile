# Gunakan image Go yang ringan
FROM golang:1.17-alpine

# Set working directory
WORKDIR /app

# Copy go.mod dan go.sum untuk dependency caching
COPY go.mod go.sum ./

# Unduh dependency
RUN go mod download

# Salin semua kode sumber ke dalam container
COPY . .

# Build aplikasi dengan environment variabel yang sesuai
RUN CGO_ENABLED=0 GOOS=linux go build -o belajar-cicd-pemula .

# Set environment variable untuk port
ENV PORT 8080

# Expose port untuk aplikasi
EXPOSE 8080

# Command untuk menjalankan aplikasi
CMD ["./belajar-cicd-pemula"]
