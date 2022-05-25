//
//  CategoryButton.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct CategoryButton: View {
    @State var category: CategoryModel
    @Binding var activeCategory: CategoryModel
    
    @State var function: ()->Void
    
    var body: some View {
        Button {
            function()
        } label: {
            HStack{
                Text(category.title)
                    .font(.h2)
                    .foregroundColor(activeCategory == category ? .white : Color("secondaryText"))
                    .padding()
                    .padding(.horizontal, 8)
            }
            .background(activeCategory == category ? Color("primary") : Color("form"))
            .cornerRadius(32.0)
        }
    }
}
