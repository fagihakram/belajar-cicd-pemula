Dockerfile :
FROM golang:1.17-alpine

WORKDIR /app

COPY go.mod ./
COPY *.go ./
COPY static ./static

RUN go build -o /belajar-cicd-pemula

# EXPOSE 3000
RUN CGO_ENABLED=0 GOOS=linux go build -o /belajar-cicd-pemula
ENV PORT 8080
CMD ["/belajar-cicd-pemula"]

main.go :
package main

import (
	"log"
	"net/http"
)

func main() {
	http.Handle("/", http.FileServer(http.Dir("./static")))
	log.Println("listening on port 8080...")
	http.ListenAndServe(":8080", nil)
}
