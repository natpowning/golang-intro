package main

import (
	"net/http"

	"github.com/natpowning/golang-intro/controllers"
)

func main() {
	controllers.RegisterControllers()
	http.ListenAndServe(":3000", nil)
}
