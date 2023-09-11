//
//  Category.swift
//  FastPizza
//
//  Created by sevilay tanis on 23.07.2023.
//

import Foundation
import FirebaseFirestore


struct Category: Identifiable, Equatable {
    
    var id              :Int
    var name    : String
    var image           : String
    
    var representation: [String: Any] {
        var temp = [String: Any]()
        temp["id"] = self.id
        temp["name"] = self.name
        temp["image"] = self.image
        return temp
    }
    
    internal init(id: Int ,
                  name: String,
                  image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? Int else { return nil }
        guard let name = data["name"] as? String else {return nil}
        guard let image = data["image"] as? String else { return nil }
        
        self.id = id
        self.name = name
        self.image = image
    }
    
}
