//
//  ProductSell.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct ProductCell: View {
    
    @State var image: UIImage?
    
    var product: Product
    
    var body: some View {
        
        ZStack (alignment: .topTrailing){
            
            VStack (alignment: .leading) {
            
                if image != nil {
                    Image(product.image )
                        .resizable()
                        .padding(.bottom, 1.0)
                        .scaledToFit()
                        .frame(width: 180,height: 150)
                        .fixedSize().background(Color.gray.opacity(0.03))
                } else {
                       ProgressView().tint(.red)
                    .frame(width: 180, height: 240)
                }
                
                VStack (alignment: .leading   ){
                    Text(product.brand)
                        .font(.footnote)
                        .lineLimit(1)
                        .padding(.bottom, 0.5)
                    Text(product.title).lineLimit(2).font(.caption).foregroundColor(.black).opacity(0.5)
                }
               // .padding(2)
                .frame(width: 180, alignment: .leading)
               // .cornerRadius(20)
            }
        }.padding([.leading, .bottom],10).onAppear {
            
            
            let queue2 = DispatchQueue(label: "queue2", qos: .userInitiated, attributes: .concurrent)
            queue2.async {
                StorageService.shared.downloadImage(id: self.product.id) { result in
                    switch result {
                    case .success(let uiImage):
                        if let image = UIImage(data: uiImage) {
                            self.image = image
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            
            
        }
    }
}
//                     🔱
struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Examples.shared.product)
    }
}
