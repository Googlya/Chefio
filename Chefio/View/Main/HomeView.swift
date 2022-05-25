//
//  HomeVIew.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct HomeView: View {
    @State var activeCategory: CategoryModel = .all
        
    @State var showHeaderAndFooter: Bool = true
    @State var offsetY: CGFloat = 0.0
    
    var body: some View {
        VStack{
            VStack{
                HeaderHome(activeCategory: $activeCategory)
                    .padding()
                
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color("form"))
                    .frame(height: 7, alignment: .center)
            }
            .offset(y: showHeaderAndFooter ? 0.0 : -400)
            
            BodyHome()
                .frame(maxHeight: .infinity, alignment: .center)
//                .gesture(
//                    DragGesture()
//                        .onChanged({ gesture in
//                            offsetY = gesture.translation.height
//                            print(offsetY)
//                            if offsetY < -5 {
//                                withAnimation {
//                                    showHeaderAndFooter = false
//                                }
//                            } else {
//                                withAnimation {
//                                    showHeaderAndFooter = true
//                                }
//                            }
//                        })
//                )
            
            FooterView()
                .offset(y: showHeaderAndFooter ? 0.0 : 400)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

fileprivate struct HeaderHome: View {
    @Binding var activeCategory: CategoryModel

    var body: some View {
        VStack(alignment: .leading){
            //Search button
            Text("Category:")
                .foregroundColor(Color("mainText"))
                .font(.h1)

            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10){
                    ForEach(CategoryModel.allCases, id: \.self) { category in
                        CategoryButton(category: category, activeCategory: $activeCategory) {
                            withAnimation {
                                activeCategory = category
                            }
                        }
                    }
                }
            }
        }
    }
}

fileprivate struct BodyHome: View {
    @State var mockItem: RecipeModel = RecipeModel(id: 1, title: "Test", image: "https://html5css.ru/css/img_lights.jpg", category: .food, time: 30, author: AuthorModel(id: 1, image: "https://html5css.ru/css/img_lights.jpg", name: "Abama"))
    
    @State var gridItems: [GridItem] = [GridItem(.flexible(), spacing: 10, alignment: .leading), GridItem(.flexible(), spacing: 10, alignment: .leading)]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridItems, alignment: .center, spacing: 10) {
                ForEach(0...20, id: \.self) {_ in
                    RecipeBlockView(item: mockItem)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
