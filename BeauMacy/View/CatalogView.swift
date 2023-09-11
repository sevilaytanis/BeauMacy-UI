//
//  CatalogView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct CatalogView: View {
    
    @StateObject var viewModel = CatalogViewModel()
    @State var category = 0

    var layout = [GridItem(.adaptive(minimum: 150), spacing: 50)]
   
    @State private var searchText = ""

    func runSearch() {
        Task {
            viewModel.getProductsByText(text:searchText)
        }
    }
    
    
    var body: some View {
       
        NavigationStack {
            Text("\(searchText)")
                .navigationTitle("Products")
                                    .font(.largeTitle)
            ScrollView {
                Section {
                    ScrollView (.vertical, showsIndicators: false) {
                        LazyVGrid(columns: layout) {
                            ForEach(viewModel.products) { item in
                                
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundColor(.black).background(Color.white.opacity(0.2))
                                }
                            }.background(.white)
                        } .padding([.bottom,.top])
                            .padding([.leading,.trailing])
                    }.background(Color.gray.opacity(0.1))
                   
                }.searchable(text: $searchText)
            }
      
        }
        .onAppear {
            if category == 0 {
                viewModel.getProducts()
            }
            else
            {
                viewModel.getProductsByCategoryAndText(categoryId: category, text: searchText)
            }
        }.onChange(of: searchText){ newValue in
            if newValue.isEmpty
            {
                viewModel.getProducts()
            }
            else {
                runSearch()
            }
                
        }
                
    }
   
}
//                     🔱
struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
