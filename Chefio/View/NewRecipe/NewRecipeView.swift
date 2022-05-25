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
                        .foregroundColor(Color("secondary"))
                        .font(.h2)
                }
                
                Spacer()
                
                Text("1/").foregroundColor(Color("mainText")).font(.h2) + Text("2").foregroundColor(Color("secondaryText")).font(.h2)
            }
            .padding(.horizontal)
            
            
            Button {
                
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 16.0)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1.0, lineJoin: .round, dash: [10], dashPhase: 0))
                        .foregroundColor(Color("outline"))
                    
                    VStack{
                        Text("Add Cover Photo")
                            .foregroundColor(Color("mainText"))
                            .font(.h3)
                        
                        Text("(up to 12 Mb)")
                            .foregroundColor(Color("secondaryText"))
                            .font(.s)
                    }
                }
                .padding()
            }

            
            VStack(alignment: .leading){
                Text("Food Name")
                    .foregroundColor(Color("mainText"))
                    .font(.h2)
                
                CustomTextField(placeholder: "Enter food name", text: $foodName)
            }
            .padding()
            
            VStack(alignment: .leading){
                Text("Description")
                    .foregroundColor(Color("mainText"))
                    .font(.h2)
                
                TextEditor(text: $foodDescription)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16.0)
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(Color("outline"))
                    )
            }
            .padding()
            
            VStack(alignment: .leading){
                Text("Cooking Duration ").foregroundColor(Color("mainText")).font(.h2) + Text("(in minutes)").foregroundColor(Color("secondaryText")).font(.p1)
                
                VStack{
                    HStack{
                        Text("<10")
                            .font(.h3)
                            .foregroundColor(Color("primary"))
                        Spacer()
                        Text("30")
                            .font(.h3)
                            .foregroundColor(foodTime >= 30 ? Color("primary") : Color("secondaryText"))
                        Spacer()
                        Text(">60")
                            .font(.h3)
                            .foregroundColor(foodTime >= 60 ? Color("primary") : Color("secondaryText"))
                    }
                    CustomSlider(minimumValue: 10.0, maximumValue: 60.0, thumbColor: UIColor(Color("primary")), minTrackColor: UIColor(Color("primary")), maxTrackColor: UIColor(Color("outline")), value: $foodTime)
                        .foregroundColor(Color("primary"))
                }
                .padding(.vertical)
            }
            .padding()
            
            ButtonConstructor(text: "Next", fullWidth: true) {
                
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
