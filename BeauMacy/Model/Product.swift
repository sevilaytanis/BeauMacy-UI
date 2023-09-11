//
//  Product.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import Foundation
import FirebaseFirestore

struct Product: Identifiable, Equatable {
    
    var id         : Int
    var brand      : String
    var title      : String
    var image      : String
    var description: String
    
    var representation: [String: Any] {
        var temp = [String: Any]()
        temp["id"] = self.id
        temp["brand"] = self.brand
        temp["title"] = self.title
        temp["image"] = self.image
        temp["description"] = self.description
        return temp
    }
    
    internal init(id: Int ,
                  brand: String,
                  title: String,
                  image: String,
                  description: String) {
        self.id = id
        self.brand = brand
        self.title = title
        self.image = image
        self.description = description
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? Int else { return nil }
        guard let brand = data["brand"] as? String else {return nil}
        guard let title = data["title"] as? String else { return nil }
        guard let image = data["image"] as? String else { return nil }
        guard let description = data["description"] as? String else { return nil }
        self.id = id
        self.brand = brand
        self.title = title
        self.image = image
        self.description = description
    }
}
