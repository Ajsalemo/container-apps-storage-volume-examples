package index

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"
)

func ReadRoute(w http.ResponseWriter, r *http.Request) {
	filename := "file.txt"
	directory := "files"

	f, err := os.ReadFile(filepath.Join(directory, filepath.Base(filename)))
	if err != nil {
		fmt.Println(err)
	}

	println(string(f))
	
	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")

	resp := make(map[string]string)
	resp["message"] = string(f)
	jsonResp, err := json.Marshal(resp)

	if err != nil {
		log.Fatalf("Error happened in JSON marshal. Err: %s", err)
	}
	w.Write(jsonResp)
}
