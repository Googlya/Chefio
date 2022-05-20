//
//  FooterView.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(spacing: 0){
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color("form"))
                .frame(height: 1, alignment: .center)
            HStack{
                Button {
                    
                } label: {
                    VStack{
                        Image(systemName: "house.fill")
                            .font(.h1)
                            .foregroundColor(Color("primary"))

                        Text("Home")
                            .foregroundColor(Color("primary"))
                            .font(.p1)
                    }
                }
                
                Spacer()

                Button {
                    
                } label: {
                    VStack{
                        Image(systemName: "pencil.circle.fill")
                            .font(.h1)
                            .foregroundColor(Color("primary"))
                        
                        Text("Upload")
                            .foregroundColor(Color("primary"))
                            .font(.p1)
                    }
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    VStack{
                        Image(systemName: "bell.fill")
                            .font(.h1)
                            .foregroundColor(Color("primary"))
                        
                        Text("Notification")
                            .foregroundColor(Color("primary"))
                            .font(.p1)
                    }
                }
                
                Spacer()

                Button {
                    
                } label: {
                    VStack{
                        Image(systemName: "person.fill")
                            .font(.h1)
                            .foregroundColor(Color("primary"))
                        
                        Text("Profile")
                            .foregroundColor(Color("primary"))
                            .font(.p1)
                    }
                }

            }
            .padding()
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
