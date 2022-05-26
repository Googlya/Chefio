//
//  NewRecipeDescriptionView.swift
//  Chefio
//
//  Created by Александр Фарносов on 25.05.2022.
//

import SwiftUI

struct NewRecipeDescriptionView: View {
    @State var ingridients: [IngredientsGroupModel] = [IngredientsGroupModel(name: "general", childs: [""])]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 8){
                HStack{
                    Button {
                        //route
                    } label: {
                        Text("Cancel")
                            .foregroundColor(AppColor.secondary.color)
                            .font(.h2)
                    }
                    
                    Spacer()
                    
                    Text("2/").foregroundColor(AppColor.mainText.color).font(.h2) + Text("2").foregroundColor(AppColor.secondaryText.color).font(.h2)
                }
                .padding(.horizontal)
                
                VStack{
                    HStack{
                        Text("Ingredients")
                            .foregroundColor(AppColor.mainText.color)
                            .font(.h2)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            HStack{
                                Image(systemName: "plus")
                                    .foregroundColor(AppColor.mainText.color)
                                
                                Text("Group")
                                    .foregroundColor(AppColor.mainText.color)
                                    .font(.p2)
                            }
                        }
                        
                    }
                }
                .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(AppColor.form.color)
                    .frame(height: 7, alignment: .center)
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Steps")
                            .foregroundColor(AppColor.mainText.color)
                            .font(.h2)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

        }
    }
}

fileprivate struct IngridientsView: View {
    var body: some View {
        VStack{
            
        }
    }
}

struct NewRecipeDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeDescriptionView()
    }
}
