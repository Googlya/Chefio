//
//  VerificationCodeView.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct VerificationCodeView: View {
    @State var text: String = ""
    @State var validCode: Bool = false
    
    var body: some View {
        VStack{
            Text("Check your email")
                .foregroundColor(Color("mainText"))
                .font(.h1)
                .padding()
            
            Text("We.ve sent the code to your email")
                .foregroundColor(Color("secondaryText"))
                .font(.p2)
                .padding()
            
            Spacer()
            
            VerificationField(pins: $text, countCells: 4) {
                
            }
            .onChange(of: text) { newValue in
                if newValue.count >= 4 {
                    withAnimation {
                        validCode = true
                    }
                } else {
                    withAnimation {
                        validCode = false
                    }
                }
            }
            
            Spacer()
            
            ValidationButtonConstructor(text: "Verify", fullWidth: true, valid: $validCode) {
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView()
    }
}
