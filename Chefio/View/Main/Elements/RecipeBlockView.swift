//
//  ReceiptView.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct RecipeBlockView: View {
    @State var item: RecipeModel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                RemoteImageView(url: URL(string: item.author.image)!) {
                    ProgressView()
                } image: {
                    $0.resizable().aspectRatio(1.0, contentMode: .fit).clipped().cornerRadius(16.0)
                }

                Text(item.author.name)
            }
            .frame(height: 45, alignment: .leading)
            
            RemoteImageView(url: URL(string: item.image)!) {
                ProgressView()
            } image: {
                $0.resizable().aspectRatio(1.0, contentMode: .fit).clipped().cornerRadius(16.0)
            }

            Text(item.title)
                .font(.h2)
                .foregroundColor(AppColor.mainText.color)
            
            HStack{
                Text(item.category.title)
                    .font(.s)
                    .foregroundColor(AppColor.secondaryText.color)

                Circle()
                    .foregroundColor(AppColor.secondaryText.color)
                    .frame(width: 5, height: 5, alignment: .center)
                
                Text("\(item.time)")
                    .font(.s)
                    .foregroundColor(AppColor.secondaryText.color)

            }
        }
    }
    
    private var squareShape: some View {
        return Rectangle().aspectRatio(1.0, contentMode: .fit).cornerRadius(16.0)
    }
}

struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeBlockView(item: RecipeModel(id: 1, title: "Test", image: "https://html5css.ru/css/img_lights.jpg", category: .food, time: 30, author: AuthorModel(id: 1, image: "https://html5css.ru/css/img_lights.jpg", name: "Abama")))
    }
}
