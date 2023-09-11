//
//  CategoryCell.swift
//  FastPizza
//
//  Created by sevilay tanis on 13.08.2023.
//

import SwiftUI

struct CategoryCell: View {
    
    @State var image: UIImage?
    var category:  Category
    
    var body: some View {
        
        HStack (){
            HStack () {
                Text(category.name)
                    .font(.title)
                    .lineLimit(1)
                  //  .padding(.bottom, 0.5)
                    .frame(width: 230)
                    .background(Color.gray.opacity(0.03))
                
                if image != nil {
                    Image(category.image )
                        .resizable()
                        .padding(.bottom, 1.0)
                        .scaledToFit()
                        .frame(width: 180,height: 150)
                        .fixedSize()
                        .background(Color.gray.opacity(0.03))
                        .padding(.trailing,2)
                } else {
                       ProgressView().tint(.red)
                        .frame(width: 180, height: 240)
                }
               // .cornerRadius(20)
            }
            
        }//.padding([.leading, .bottom],10)
        .onAppear {
            
            
            let queue2 = DispatchQueue(label: "queue2", qos: .userInitiated, attributes: .concurrent)
            queue2.async {
                StorageService.shared.downloadImage(id: self.category.id) { result in
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
    
    struct CategoryCell_Previews: PreviewProvider {
        static var previews: some View {
            CategoryCell(category: Examples.shared.categoryExample)
        }
}

