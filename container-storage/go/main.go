package main

import (
	"log"
	"net/http"

	index "github.com/Ajsalemo/container-apps-storage-volume-examples/container-storage/go/routes/index"
	write "github.com/Ajsalemo/container-apps-storage-volume-examples/container-storage/go/routes/write"
	read "github.com/Ajsalemo/container-apps-storage-volume-examples/container-storage/go/routes/read"
)

func main() {
	http.HandleFunc("/", index.IndexRoute)
	http.HandleFunc("/api/write", write.WriteRoute)
	http.HandleFunc("/api/read", read.ReadRoute)

	log.Printf("server listening at 0.0.0.0:8080")
	err := http.ListenAndServe(":8080", nil)

	if err != nil {
		log.Fatalf("Failed to start the HTTP server!")
	}
}