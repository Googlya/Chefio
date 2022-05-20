//
//  ValidationButtonConstructor.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct ValidationButtonConstructor: View {
    @State var text: String
    @State var fullWidth: Bool
    @Binding var valid: Bool
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
            .background(valid ? Color("primary") : Color("outline"))
            .cornerRadius(32.0)
        }
        .disabled(!valid)
        .padding(.horizontal)
    }
}

//struct ValidationButtonConstructor_Previews: PreviewProvider {
//    static var previews: some View {
//        ValidationButtonConstructor(text: "Test", fullWidth: true, valid: Binding<true>, function: <#() -> Void#>)
//    }
//}
