//
//  FavoriteViewModel.swift
//  FastPizza
//
//  Created by sevilay tanis on 2.09.2023.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    
    @Published var favorites = [Product]()

    init(favorites: [Product]) {
        self.favorites = favorites
    }
    
    func getProducts() {
        DatabaseService.shared.getProducts() { result in
            switch result {
            case .success(let favorites):
                self.favorites = favorites
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
   

}
