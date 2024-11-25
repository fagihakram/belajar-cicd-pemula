package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	// Ambil port dari environment variable
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080" // Default port jika tidak diatur
	}

	// Setup file server untuk melayani file statis
	http.Handle("/", http.FileServer(http.Dir("./static")))

	// Jalankan server
	log.Printf("Server listening on port %s...", port)
	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
