//
//  FavoriteService.swift
//  FastPizza
//
//  Created by sevilay tanis on 22.06.2023.
//

import Foundation

class FavoriteService : ObservableObject {
    
    private var favs : Set<Int>
    
    init(){
        
        favs = []
    }
    
    func contain(_ productId: Int) -> Bool
    {
       return favs.contains(productId)
    }
    
    func add(_ productId: Int) -> Void
    {
    
        if(!favs.contains(productId))
        {
            objectWillChange.send()
            favs.insert(productId)
            save()
        }
    }
    
    func remove(_ productId: Int) -> Void
    {
        objectWillChange.send()
        favs.remove(productId)
        save()
    }
    
    func toggleFav(_ productId: Int) -> Void
    {
        objectWillChange.send()
        if(favs.contains(productId))
        {
            favs.remove(productId)
        }
        else
        {
            favs.insert(productId)
        }
    }
    
    func save(){
        
    }
}
