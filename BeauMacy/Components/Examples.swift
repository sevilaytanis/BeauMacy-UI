//
//  Examples.swift
//  FastPizza
//
//  Created by Alex Karamanets on 01.02.2023.
//

import Foundation
import UIKit

struct Examples {
    
    static let shared = Examples()
    
    static let user =  DataUser (id: "1", name: "sevilay", phone: 21211111, address: "istanbul")
    
    
    
    static let productList = [Product(id: 1,
                                      brand: "Cliniq",
                                      title: "Face Cream",
                                       image: "cliniq",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friendThe best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friendThe best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friendThe best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friendThe best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friendThe best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                              Product(id: 2,
                                      brand: "Glosier",
                                      title: "Lip Stick",
                                      image: "glosier",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                              Product(id: 3,
                                      brand: "Holynails",
                                      title: "nail color",
                                      image: "holysnails",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                              Product(id: 4,
                                      brand: "IsClinical",
                                      title: "Face Cleaner",
                                      image: "isclinical",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                              Product(id: 5,
                                      brand: "La Roche",
                                      title: "c10laroche",
                                      image: "tlc",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                              Product(id: 6,
                                      brand: "Illuminating",
                                      title: "Closer Eyes",
                                      image: "lluminating",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
    
                              Product(id: 7,
                                      brand: "Ordinary",
                                      title: "Eye Cream",
                                      image: "ordinary",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                              Product(id: 8,
                                      brand: "Oskia",
                                      title: "Original Cofee Cream",
                                      image: "oskia",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                              Product(id: 9,
                                      brand: "Pestle",
                                      title: "Lip Stick",
                                      image: "pestle",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                              Product(id: 10,
                                      brand: "Suman",
                                      title: "Clearing Face",
                                      image: "suman",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                              Product(id: 11,
                                      brand: "Timeless",
                                      title: "Parfume",
                                      image: "timeless",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                              Product(id: 12,
                                      brand: "TLC",
                                      title: "Serum For Face",
                                      image: "tlc",
                                      description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend")]
    
    private init() {}
    
    
    let dataUser = DataUser(id: "", name: "Lucius", phone: 999_99_99, address: "California CA, Central park building 7/2 apartment 11  ")
    
    let descriptionAdd = "The photo of the product must be 1280x1024 or larger"
    
    let uiImage = UIImage(named: "beau-science3")
    
    let product = Product(id: 1,
                          brand: "Suman",
                          title: "Face cream",
                          image: "suman",
                          description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend ")
    
    let category = [Category( id:1 ,
                              name: "Face Cream",
                              image: "cliniq"),
                    Category( id:2 ,
                              name: "Shampo",
                              image: "holysnails"),
                    Category( id:3 ,
                              name: "Body Lotion",
                            image: "isclinical"),
                    Category( id:4 ,
                              name: "Eye Cream",
                            image: "suman"),
                    Category( id:5 ,
                              name: "Hair Care",
                            image: "oskia")]
    
    let categoryExample = Category( id:1 ,
                                   name: "Face Cream",
                                   image: "suman")
    
    
    let  fakeProducts = [Product(id: 1,
                            brand: "Cream",
                           title: "Cream",
                            image: "beau-cream",
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: 2,
                           brand: "Diablo",
                           title: "diable",
                           image: "beau-fruit",
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: 3,
                           brand: "beau-girl",
                           title: "beau-girl",
                           image: "beau-girl",
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: 4,
                           brand:  "beau-mint",
                           title: "beau-mint",
                           image: "beau-mint",
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: 5,
                           brand: "beau-spice",
                           title: "beau-spice",
                           image: "beau-spice",
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: 6,
                           brand: "beau-vegas",
                           title: "beau-vegas",
                           image: "beau-vegas",
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend")]
    
    static let fakeIngredient = [
        Ingredient(id: 1,
                   Name: "Cyclopentasiloxane",
                   Description: "emollient,solvent",
                   Rate: "2",
                   Link: "",
                   Comedigonicty: "",
                   Rating: 2),
        Ingredient(id: 2,
                   Name: "Water",
                   Description: "solvent",
                   Rate: "3",
                   Link: "",
                   Comedigonicty: "",
                   Rating: 3),
        Ingredient(id: 3,
                   Name: "Dimethicone",
                   Description: "emollient",
                   Rate: "4",
                   Link: "",
                   Comedigonicty: "",
                   Rating: 4),
        Ingredient(id: 5,
                   Name: "Olea Europaea Fruit Oil",
                   Description: "emollient,antioxidan",
                   Rate: "5",
                   Link: "",
                   Comedigonicty: "",
                   Rating: 6),
        Ingredient(id: 6,
                   Name: "Tocopherol (Vitamin E/Antioxidant)",
                   Description: "antioxidant",
                   Rate: "6",
                   Link: "",
                   Comedigonicty: "",
                   Rating: 7)]
}
