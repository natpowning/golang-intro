package main

import (
	"net/http"
	"os"

	"github.com/natpowning/golang-intro/controllers"
)

func main() {
	port := os.Getenv("PORT")
	if len(port) == 0 {
		port = "8080"
	} else {
		port = os.Getenv("PORT")
	}
	address := ":" + port
	controllers.RegisterControllers()
	http.ListenAndServe(address, nil)
}
