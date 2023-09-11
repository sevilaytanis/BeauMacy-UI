//
//  MainTabBar.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct MainTabBarView: View {
    
   // var viewModel: MainTabBarViewModel
    
    var body: some View {
        
        TabView {
         
            /*
            CatalogView().padding(.top ,20).padding(.bottom, 10)
            */
            
            CatalogView().tabItem()
            {
                Image(systemName: "house.fill")
                Text("Main Page")
            }
            
            CategoryView(viewModel: CategoryViewModel(categories: Examples.shared.category)).tabItem()
            {
                Image(systemName: "list.bullet.rectangle.fill")
                Text("Categories")
            }
            CatalogView().tabItem()
            {
                Image(systemName: "magnifyingglass.circle.fill")
                Text("Search")
            }
            FavoriteView(viewModel: FavoriteViewModel(favorites: Examples.shared.fakeProducts)).tabItem()
            {
                Image(systemName: "heart.fill")
                Text("Favorites")
            }

            
            ProfileView(vm: ProfileViewModel(profile: Examples.shared.dataUser)).tabItem()
            {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }

            
                
            /*.tabItem {
                    Image(systemName: "menucard.fill")
                    Text("Catalog")
                }
                .toolbarBackground(.hidden, for: .tabBar)
            */
            
            /*
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
                .toolbarBackground(.hidden, for: .tabBar)
            */
            
            /*
            ProfileView( vm: ProfileViewModel(profile: Examples.shared.dataUser))
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
             */
            
        }
    }
}
//                     🔱
struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}



