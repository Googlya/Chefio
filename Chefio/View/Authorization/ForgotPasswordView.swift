//
//  ForgotPasswordView.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var login: String = ""
    @State var validLogin: Bool = false
    
    var body: some View {
        VStack{
            Text("Password recovery")
                .foregroundColor(AppColor.mainText.color)
                .font(.h1)
                .padding()
            
            Text("Enter your email to recover your password")
                .foregroundColor(AppColor.secondaryText.color)
                .font(.p2)
                .multilineTextAlignment(.center)
                .padding()
            
            CustomTextField(placeholder: "Email or phone number", text: $login, imageName: "mail")
                .onChange(of: login) { newValue in
                    if newValue.contains("@") && !newValue.isEmpty {
                        withAnimation {
                            validLogin = true
                        }
                    } else {
                        withAnimation {
                            validLogin = false
                        }
                    }
                }
                .padding()
            
            ValidationButtonConstructor(text: "Sign In", fullWidth: true, valid: $validLogin) {
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
