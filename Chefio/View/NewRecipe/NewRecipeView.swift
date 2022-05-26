//
//  NewRecipeView.swift
//  Chefio
//
//  Created by Александр Фарносов on 25.05.2022.
//

import SwiftUI

struct NewRecipeView: View {
    @State var foodName: String = ""
    @State var foodDescription: String = ""
    @State var foodTime: Double = 10.0
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    //route
                } label: {
                    Text("Cancel")
                        .foregroundColor(AppColor.secondary.color)
                        .font(.h2)
                }
                
                Spacer()
                
                Text("1/").foregroundColor(AppColor.mainText.color).font(.h2) + Text("2").foregroundColor(AppColor.secondaryText.color).font(.h2)
            }
            .padding(.horizontal)
            
            
            Button {
                
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 16.0)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1.0, lineJoin: .round, dash: [10], dashPhase: 0))
                        .foregroundColor(AppColor.outline.color)
                    
                    VStack{
                        Text("Add Cover Photo")
                            .foregroundColor(AppColor.mainText.color)
                            .font(.h3)
                        
                        Text("(up to 12 Mb)")
                            .foregroundColor(AppColor.secondaryText.color)
                            .font(.s)
                    }
                }
                .padding()
            }

            
            VStack(alignment: .leading){
                Text("Food Name")
                    .foregroundColor(AppColor.mainText.color)
                    .font(.h2)
                
                CustomTextField(placeholder: "Enter food name", text: $foodName)
            }
            .padding()
            
            VStack(alignment: .leading){
                Text("Description")
                    .foregroundColor(AppColor.mainText.color)
                    .font(.h2)
                
                TextEditor(text: $foodDescription)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16.0)
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(AppColor.outline.color)
                    )
            }
            .padding()
            
            VStack(alignment: .leading){
                Text("Cooking Duration ").foregroundColor(AppColor.mainText.color).font(.h2) + Text("(in minutes)").foregroundColor(AppColor.secondaryText.color).font(.p1)
                
                VStack{
                    HStack{
                        Text("<10")
                            .font(.h3)
                            .foregroundColor(AppColor.primary.color)
                        Spacer()
                        Text("30")
                            .font(.h3)
                            .foregroundColor(foodTime >= 30 ? AppColor.primary.color : AppColor.secondaryText.color)
                        Spacer()
                        Text(">60")
                            .font(.h3)
                            .foregroundColor(foodTime >= 60 ? AppColor.primary.color : AppColor.secondaryText.color)
                    }
                    CustomSlider(minimumValue: 10.0, maximumValue: 60.0, thumbColor: UIColor(Color("primary")), minTrackColor: UIColor(Color("primary")), maxTrackColor: UIColor(Color("outline")), value: $foodTime)
                        .foregroundColor(Color("primary"))
                }
                .padding(.vertical)
            }
            .padding()
            
            ButtonConstructor(text: "Next", fullWidth: true, backgroundColor: .primary) {
                
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
