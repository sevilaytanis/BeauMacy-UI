//
//  Category.swift
//  FastPizza
//
//  Created by sevilay tanis on 23.07.2023.
//

import SwiftUI

struct FavoriteView: View {

    
    @StateObject var viewModel: FavoriteViewModel

    var layout = [GridItem(.adaptive(minimum: 400), spacing: 50)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Section {
                    ScrollView (.vertical, showsIndicators: false) {
                        LazyVGrid(columns: layout) {
                            ForEach(viewModel.favorites) { item in
                                
                                NavigationLink {
                                    let product = ProductDetailViewModel(product: item)
                                    ProductDetailView(viewModel: product)
                                } label: {
                                    FavoriteCell(favorite: item)
                                        .foregroundColor(.black).background(Color.white.opacity(0.2))
                                }
                                
                            }.background(.white)
                        } .padding([.bottom,.top])
                            .padding([.leading,.trailing])
                    }.background(Color.gray.opacity(0.1))
                   
                }
            }
        }
       }
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(viewModel: FavoriteViewModel(favorites: Examples.shared.fakeProducts))
    }
}
