//
//  DatabaseService.swift
//  FastPizza
//
//  Created by Alex Karamanets on 26.01.2023.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService()
    
    private init() { }
    
    private let db = Firestore.firestore()
    
    private var userReference: CollectionReference { db.collection("users") }
    
    private var orderReference: CollectionReference { db.collection("orders") }
    
    private var productsReference: CollectionReference { db.collection("products") }
    
    
    func setProfile(user: DataUser, completion: @escaping (Result<DataUser, Error>) -> Void) {
        
        userReference.document(user.id).setData(user.representation) { error in
            
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(by userID: String? = nil, completion: @escaping (Result<DataUser, Error>) -> Void) {
        
        userReference.document(userID != nil ? userID! : AuthService.shared.currentUser!.uid).getDocument { snapshot, error in
            
            guard let snap = snapshot else { return }
            guard let data = snap.data() else { return }
            guard let id = data["id"] as? String else { return }
            guard let name = data["name"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let address = data["address"] as? String else { return }
            
            let user = DataUser(id: id, name: name, phone: phone, address: address)
            
            completion(.success(user))
        }
    }
    

    func setProducts(product: Product, image: Data, completion: @escaping (Result<Product, Error>) -> Void) {
        
        StorageService.shared.upload(id: product.id, image: image) { result in
            switch result {
            case .success(let sizeInfo):
                print(sizeInfo)
                self.productsReference.document(String(product.id)).setData(product.representation) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(product))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
    }
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        
        completion(.success(Examples.productList))// fill with dummy data
        
        
        self.productsReference.getDocuments { qSnap, error in
            
            guard let qSnap = qSnap else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            let docs = qSnap.documents
            var products = [Product]()
            
            for item in docs {
                guard let product = Product(doc: item) else { return }
                products.append(product)
            }
            completion(.success(products))
        }
    }
    
    func getProductsByText(text:String, completion: @escaping (Result<[Product], Error>) -> Void) {
        
        completion(.success(Examples.productList.filter({$0.brand.contains(text) || $0.title.contains(text) || $0.description.contains(text) }))) // fill with dummy data
        
        
        self.productsReference.getDocuments { qSnap, error in
            
            guard let qSnap = qSnap else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            let docs = qSnap.documents
            var products = [Product]()
            
            for item in docs {
                guard let product = Product(doc: item) else { return }
                products.append(product)
            }
            completion(.success(products))
        }
    }
    
    func getCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        
        completion(.success(Examples.shared.category))// fill with dummy data
        
        
        self.productsReference.getDocuments { qSnap, error in
            
            guard let qSnap = qSnap else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            let docs = qSnap.documents
            var categories = [Category]()
            
            for item in docs {
                guard let category = Category(doc: item) else { return }
                categories.append(category)
            }
            completion(.success(categories))
        }
    }
}
