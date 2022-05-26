//
//  ButtonConstructor.swift
//  Chefio
//
//  Created by Александр Фарносов on 19.05.2022.
//

import SwiftUI

struct ButtonConstructor: View {
    
    @State var text: String
    @State var fullWidth: Bool
    @State var backgroundColor: AppColor
    @State var function: ()->Void
    
    var body: some View {
        Button {
            function()
        } label: {
            HStack{
                if fullWidth {
                    Spacer()
                }
                
                Text(text)
                    .font(.h2)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.vertical, 8)
                
                if fullWidth {
                    Spacer()
                }
            }
            .background(backgroundColor.color)
            .cornerRadius(32.0)
        }
        .padding(.horizontal)

    }
}

struct ButtonConstructor_Previews: PreviewProvider {
    static var previews: some View {
        ButtonConstructor(text: "Get Started", fullWidth: false, backgroundColor: .primary) {
            
        }
    }
}
