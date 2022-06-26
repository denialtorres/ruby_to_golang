package main

import "fmt"

type Dog struct {
  Name  string
	Breed string
  Age   int
}

func main() {
  pet := Dog{
    Name: "Maximus",
    Breed: "Rottweiler",
    Age: 5,
  }

  fmt.Println(pet)
}
