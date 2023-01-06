package index

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"

	"github.com/google/uuid"
)

func WriteRoute(w http.ResponseWriter, r *http.Request) {
	uuid := uuid.New()
	filename := uuid.String() + ".txt"
	directory := "files"

	// Create the file under the ./files directory
	f, err := os.Create(filepath.Join(directory, filepath.Base(filename)))
	if err != nil {
		fmt.Println(err)
	}
	// Close the file but defer it until execution is done
	defer f.Close()
	
	s := []byte("This is a file being stored on container storage")
	f.Write(s)

	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")

	resp := make(map[string]string)
	resp["message"] = "File name " + filename + " created."
	jsonResp, err := json.Marshal(resp)

	if err != nil {
		log.Fatalf("Error happened in JSON marshal. Err: %s", err)
	}
	w.Write(jsonResp)
}
