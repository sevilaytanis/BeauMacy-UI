//
//  CategoryCell.swift
//  FastPizza
//
//  Created by sevilay tanis on 13.08.2023.
//

import SwiftUI

struct FavoriteCell: View {
    
    @State var image: UIImage?
    var favorite:  Product
    
    var body: some View {
        
        HStack (){
            HStack () {
                
                
                if image != nil {
                    Image(favorite.image )
                        .resizable()
                        .padding(.bottom, 1.0)
                        .scaledToFit()
                        .frame(width: 150,height: 130)
                        .fixedSize()
                        .background(Color.gray.opacity(0.03))
                    
                    VStack{
                        Text(favorite.brand)
                            .font(.title)
                            .lineLimit(1)
                            .frame(width: 200)
                            .background(Color.gray.opacity(0.03))
                        
                        Text(favorite.title)
                            .font(.footnote)
                            .lineLimit(1)
                            .frame(width: 150)
                            .background(Color.gray.opacity(0.03))
                    }
                    
                } else {
                       ProgressView().tint(.red)
                    .frame(width: 150, height: 130)
                }
               // .cornerRadius(20)
            }
            
        }//.padding([.leading, .bottom],10)
        .onAppear {
            
            
            let queue2 = DispatchQueue(label: "queue2", qos: .userInitiated, attributes: .concurrent)
            queue2.async {
                StorageService.shared.downloadImage(id: self.favorite.id) { result in
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
    
    struct FavoriteCell_Previews: PreviewProvider {
        static var previews: some View {
            FavoriteCell(favorite : Examples.shared.product)
        }
}

