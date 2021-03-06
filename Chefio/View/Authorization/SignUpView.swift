//
//  SignUpView.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct SignUpView: View {
    @State var login: String = ""
    
    @State var password: String = ""
    @State var passIsValid: Bool = false
    @State var passSixCharacters: Bool = false
    @State var passContainsNumber: Bool = false
    
    var body: some View {
        VStack{
            Text("Welcome!")
                .foregroundColor(AppColor.mainText.color)
                .font(.h1)
                .padding()
            
            Text("Please enter your account here")
                .foregroundColor(AppColor.secondaryText.color)
                .font(.p2)
                .padding(.vertical)
            
            CustomTextField(placeholder: "Email or phone number", text: $login, imageName: "mail")
                .padding(.horizontal)
            
            CustomSecureField(placeholder: "Password", text: $password, validPass: $passIsValid)
                .padding(.horizontal)
            
            VStack(alignment: .leading){
                Text("Your Password must contain:")
                    .foregroundColor(AppColor.mainText.color)
                    .font(.p1)
                
                HStack{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(passSixCharacters ? AppColor.primary.color : AppColor.secondaryText.color)
                    
                    Text("Atleast 6 characters")
                        .foregroundColor(passSixCharacters ? AppColor.mainText.color : AppColor.secondaryText.color)
                }
                .padding(.top)

                HStack{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(passContainsNumber ? AppColor.primary.color : AppColor.secondaryText.color)
                    
                    Text("Contains a number")
                        .foregroundColor(passContainsNumber ? AppColor.mainText.color : AppColor.secondaryText.color)
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .onChange(of: password) { newValue in
                if newValue.count >= 6 {
                    withAnimation {
                        passSixCharacters = true
                    }
                } else {
                    withAnimation {
                        passSixCharacters = false
                    }
                }
                
                if newValue.rangeOfCharacter(from: .decimalDigits) != nil {
                    withAnimation {
                        passContainsNumber = true
                    }
                } else {
                    withAnimation {
                        passContainsNumber = false
                    }
                }
                
                if passSixCharacters && passContainsNumber {
                    withAnimation {
                        passIsValid = true
                    }
                } else {
                    withAnimation {
                        passIsValid = false
                    }
                }
            }
            
            Spacer()
            
            ValidationButtonConstructor(text: "Sign Up", fullWidth: true, valid: $passIsValid) {
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
