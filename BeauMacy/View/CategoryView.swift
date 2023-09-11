//
//  Category.swift
//  FastPizza
//
//  Created by sevilay tanis on 23.07.2023.
//

import SwiftUI

struct CategoryView: View {

    
    @StateObject var viewModel: CategoryViewModel

    var layout = [GridItem(.adaptive(minimum: 400), spacing: 50)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Section {
                    ScrollView (.vertical, showsIndicators: false) {
                        LazyVGrid(columns: layout) {
                            ForEach(viewModel.categories) { item in
                                
                                NavigationLink {
                                    
                                   CatalogView(category: item.id)
                                } label: {
                                    CategoryCell(category: item)
                                        .foregroundColor(.black).background(Color.white.opacity(0.2))
                                }
                                
                            }.background(.white)
                        } .padding([.bottom,.top])
                            .padding([.leading,.trailing])
                    }.background(Color.gray.opacity(0.1))
                   
                }
            }
        }.navigationTitle("Categories")
       }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(viewModel: CategoryViewModel(categories: Examples.shared.category))
    }
}
