//
//  Action.swift
//  FastPizza
//
//  Created by sevilay tanis on 21.05.2023.
//

/*
import Foundation
import FirebaseFirestore

struct Action : Identifiable, Equatable {
    var id: Int
    var ActionName :String
    var Link: String
    
    var representation: [String: Any] {
        var temp = [String: Any]()
        temp["id"] = self.id
        temp["ActionName"] = self.ActionName
        temp["Link"] = self.Link

        return temp
    }
    
    internal init(id: String = UUID().uuidString,
                  ActionName: String,
                  Link: String) {
        self.id = Id
        self.ActionName = ActionName
        self.Link = Link
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? String else { return nil }
        guard let ActionName = data["ActionName"] as? String else { return nil }
        guard let Link = data["Link"] as? String else { return nil }

        self.id = Id
        self.ActionName = ActionName
        self.Link = Link
    }

}
*/
