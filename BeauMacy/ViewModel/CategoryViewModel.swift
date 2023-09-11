//
//  CategoryViewModel.swift
//  FastPizza
//
//  Created by sevilay tanis on 23.07.2023.
//

import Foundation

class CategoryViewModel: ObservableObject {
    
    @Published var categories = [Category]()

    init(categories: [Category]) {
        self.categories = categories
    }
    
    func getProducts() {
        DatabaseService.shared.getCategories { result in
            switch result {
            case .success(let categories):
                self.categories = categories
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
   

}
