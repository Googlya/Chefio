//
//  RecipeDescriptionView.swift
//  Chefio
//
//  Created by Александр Фарносов on 23.05.2022.
//

import SwiftUI

struct RecipeDescriptionView: View {
    var item: RecipeDescriptionModel = RecipeDescriptionModel(id: 1, title: "Cacao Maca Walnut Milk", image: "https://html5css.ru/css/img_lights.jpg", category: .food, time: 20, author: AuthorModel(id: 1, image: "https://html5css.ru/css/img_lights.jpg", name: "user"), likes: 20, description: "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your", ingredients: [IngredientsGroupModel(name: "general", childs: ["5 Eggs", "1/2 butter", "1/2 butter"]), IngredientsGroupModel(name: "garnir", childs: ["Corn"])], steps: [RecipeStepsModel(description: "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your", image: "https://html5css.ru/css/img_lights.jpg")])
    
    var size: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ZStack{
                VStack{
                    RemoteImageView(url: URL(string: item.image)!) {
                        ProgressView()
                    } image: {
                        $0.resizable().aspectRatio(1.0, contentMode: .fit).clipped().ignoresSafeArea()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                
                VStack(spacing: 30){
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.gray)
                        .frame(width: 40, height: 5, alignment: .center)
                        
                    VStack(alignment: .leading, spacing: 10){
                        Text(item.title)
                            .foregroundColor(AppColor.mainText.color)
                            .font(.h2)
                        
                        Text("\(item.category.title) * \(item.time) mins")
                            .foregroundColor(AppColor.secondaryText.color)
                            .font(.p2)
                        
                        HStack{
                            RemoteImageView(url: URL(string: item.author.image)!) {
                                ProgressView()
                            } image: {
                                $0.resizable().aspectRatio(1.0, contentMode: .fit).clipShape(Circle()).frame(width: 32, height: 32, alignment: .center)
                            }

                            Text(item.author.name)
                                .font(.h3)
                                .foregroundColor(AppColor.mainText.color)
                            
                            Spacer()
                            
                            Text("\(item.likes) likes")
                                .foregroundColor(AppColor.mainText.color)
                                .font(.h3)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.gray)
                        .frame(height: 1, alignment: .center)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Description")
                            .foregroundColor(AppColor.mainText.color)
                            .font(.h2)
                        
                        Text(item.description)
                            .foregroundColor(AppColor.secondaryText.color)
                            .font(.p2)
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.gray)
                        .frame(height: 1, alignment: .center)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Ingredients")
                            .foregroundColor(AppColor.mainText.color)
                            .font(.h2)
                        IngredientsView(items: item.ingredients)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.gray)
                        .frame(height: 1, alignment: .center)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Steps")
                            .foregroundColor(AppColor.mainText.color)
                            .font(.h2)
                        StepsView(items: item.steps)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                }
                .padding(.vertical)
                .background(
                    Color.white.cornerRadius(32.0)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.top, size.height * 0.4)

            }
        }
        .ignoresSafeArea()
        
    }
}

fileprivate struct IngredientsView: View {
    @State var items: [IngredientsGroupModel]
    
    var body: some View {
        VStack(spacing: 15){
            ForEach(items, id: \.self) { ingredients in
                VStack(alignment: .leading, spacing: 10){
                    if ingredients.name != "general" {
                        Text(ingredients.name)
                            .foregroundColor(AppColor.secondaryText.color)
                            .font(.h3)
                    }
                    ForEach(ingredients.childs, id: \.self) { child in
                        HStack{
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(AppColor.primary.color)
                            Text(child)
                                .foregroundColor(AppColor.mainText.color)
                                .font(.p2)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

fileprivate struct StepsView: View {
    @State var items: [RecipeStepsModel]
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(0..<items.count, id: \.self) { idx in
                HStack(alignment: .top){
                    ZStack{
                        Circle()
                            .foregroundColor(AppColor.mainText.color)
                        Text("\(idx + 1)")
                            .foregroundColor(.white)
                            .font(.s)
                    }
                    .frame(width: 24, height: 24, alignment: .center)
                    
                    VStack(alignment: .leading){
                        Text(items[idx].description)
                            .foregroundColor(AppColor.mainText.color)
                            .font(.p2)
                            .multilineTextAlignment(.leading)
                        
                        RemoteImageView(url: URL(string: items[idx].image)!) {
                            ProgressView()
                        } image: {
                            $0.resizable().aspectRatio(contentMode: .fit).clipped().cornerRadius(12.0)
                        }

                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct RecipeDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDescriptionView()
    }
}
