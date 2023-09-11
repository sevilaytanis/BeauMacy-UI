//
//  ProductDetailView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 19.01.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment(\.dismiss) var goBack
    
    var viewModel: ProductDetailViewModel
    
    let deSelectedImage = UIImage(named: "heart")
    let selectedImage = UIImage(named: "heart-filled")
    
    @StateObject var favorites = FavoriteService()
    @State private var size = "Medium"
    @State private var count = 1
    @State var image: UIImage?
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                VStack{
                  
                    
                    if image == nil {
                        Image(viewModel.product.image)
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .frame(maxWidth: 200, maxHeight: 200)
                            .shadow(radius: 3,x: 3,y: 3)
                            
                    } else {
                        ProgressView().tint(.gray)
                            .frame(maxWidth: .infinity, maxHeight: 500)
                    }
                    
                }.background(Color.gray.opacity(0.03))
                
                VStack{
                    Image( systemName: favorites.contain (viewModel.product.id) ? "heart.fill": "heart").foregroundColor(.red).onTapGesture {
                        favorites.toggleFav(viewModel.product.id)
                    }.frame(width: 50.0, height: 50, alignment: .center)
                }
           
                VStack (alignment: .trailing) {
                    ScrollView{
                        Text(viewModel.product.brand)
                            .font(.footnote)
                            .padding(.top, 5)
                            .padding(.bottom,2)
                            .foregroundColor(.purple)
                        Text(viewModel.product.title)
                            .font(.caption)
                            .foregroundColor(Color(.black))
                            .padding(.bottom,5)
                        Text(viewModel.product.description)
                            .font(.caption .monospaced())
                            .foregroundColor(Color(UIColor.darkGray).opacity(0.9)).padding()

                        Text("INGREDIENT") .foregroundColor(.purple)
                            .font(.footnote)
                        ScrollView{
                            LazyVGrid(columns: createGridColumns(),alignment: .leading) {
                            Group{
                                Text("Name")
                                Text("Description")
                                Text("Comedigonicty")
                                Text("Rate")
                            }.font(.footnote).foregroundColor(Color.purple)
                            ForEach(Examples.fakeIngredient) { item in
                                Text(item.Name)
                                Text(item.Description)
                                Text(item.Comedigonicty)
                                Text(item.Rate).foregroundColor(.green)
                                /*
                                 .font(.caption)
                                 .frame(width: 50, height: 50)
                                 .foregroundColor(.gray)*/
                            }.font(.caption).foregroundColor(.black).padding(.top, 1.0)
                            
                        }
                    }
                        .padding().gridColumnAlignment(.trailing)
                    
                    }
                }.background(Color.gray.opacity(0.03))
                .padding()
                .padding(.top, 10)
            
    /*
                
            Button {
                goBack()
            } label: {
                
                Image(systemName: "arrowshape.turn.up.backward")
                    .font(.system(size: 24) .bold())
                    .foregroundColor(.orange)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.9))
                .cornerRadius(50) }
                Spacer(minLength: 50)
            }
            .navigationBarTitleDisplayMode(.inline)
            //.background(Image(Enum.background))
            .ignoresSafeArea()
            .toolbar(.hidden, for: .tabBar)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            
            let queue = DispatchQueue(label: "queue", qos: .userInitiated, attributes: .concurrent)
            queue.async {
                StorageService.shared.downloadImage(id: self.viewModel.product.id) { result in
                    switch result {
                    case .success(let uiImage):
                        if let image = UIImage(data: uiImage) {
                            self.image = image
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }*/
            }
        }
    }
    let gridItems = Array(1...9)
    func createGridColumns() -> [GridItem] {
        let columns = [GridItem(.fixed(80)),
                         GridItem(.fixed(80)),
                         GridItem(.fixed( 100 )),
                         GridItem(.fixed(40))]
          return columns
      }
    

}
//                     🔱
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Examples.shared.product))
    }
}
