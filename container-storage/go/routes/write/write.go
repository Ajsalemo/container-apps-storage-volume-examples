package index

import (
	"encoding/json"
	"log"
	"net/http"
	"os"
	"fmt"
	"github.com/google/uuid"
)

func WriteRoute(w http.ResponseWriter, r *http.Request) {
	uuid := uuid.New()
	filename := fmt.Sprintf("%d.txt", uuid)
	directory := "files"
	fullFilePath := directory + filename
	// Create the file under the ./files directory
	f, err := os.Create(fullFilePath)
	if err != nil {
		fmt.Println(err)
	}
	// Close the file but defer it until execution is done
	defer f.Close()

	s := []byte("This is a file being stored on container storage")
	os.WriteFile(fullFilePath, s, 0644)

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
