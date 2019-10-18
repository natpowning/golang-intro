package main

import (
	"fmt"

	"github.com/natpowning/golang-intro/models"
)

func main() {
	u := models.User{
		ID:        2,
		FirstName: "Tricia",
		LastName:  "McMillan",
	}
	fmt.Println(u)
}
