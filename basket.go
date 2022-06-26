// a struct must represent the @product hash with
// the properties: 'name', 'flavor' and 'kind'

// another struct named basket will be an array of @products
// we will define a function and attach it to basket to interact with product


package main

import "fmt"

type basket []product

type product struct {
  name string
  flavour string
  kind string
}


func (p *basket) add_item(entry product){
  *p = append(*p, entry)

  fmt.Printf("Entry %s created!\n", entry.name)
}

func (p basket) change_item(name string, entry product) {
  for key, val := range p {
    if val.name ==  name {
      p[key] = entry
    }
  }

  fmt.Printf("Item %s changed!\n", name)
}

func (p basket) items(){
  fmt.Printf("There are %d number of items in the basket\n", len(p))

  for _,val := range p {
    fmt.Printf("Name: %s\n" +
               "Flavour: %s\n" +
               "Kind: %s\n",
               val.name,
               val.flavour,
               val.kind)
    fmt.Printf("\n")
  }
}


func main(){
  basket := new(basket)

  basket.add_item(
    product{
      name: "apple",
      flavour: "its juicy",
      kind: "fruit",
    },
  )

  basket.add_item(
    product{
      name: "carrot",
      flavour: "",
      kind: "veggies",
    },
  )

  basket.change_item("carrot",
                     product{
                       name: "cucumber",
                       flavour: "Slightly bitter with a mild melon aroma",
                       kind: "veggies",
                     },
                   )

  basket.items()
}
