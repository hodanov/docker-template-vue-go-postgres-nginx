package main

import (
	"fmt"
	"net/http"
)

func hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, you've requested: %s\n", r.URL.Path)
}

func handleRequests() {
	http.HandleFunc("/api/hello/", hello)
	http.ListenAndServe(":8081", nil)
}

func main() {
	handleRequests()
}
