//
//  SignInView.swift
//  Chefio
//
//  Created by Александр Фарносов on 19.05.2022.
//

import SwiftUI

struct SignInView: View {
    
    @State var startLogin: Bool = false
    @State var login: String = ""
    @State var password: String = ""
    
    @State var passIsValid: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                Text("Welcome Back!")
                    .foregroundColor(AppColor.mainText.color)
                    .font(.h1)
                    .padding()
                
                Text("Please enter your account here")
                    .foregroundColor(AppColor.secondaryText.color)
                    .font(.p2)
                    .padding()
                
                //TextFields
                CustomTextField(placeholder: "Email or phone number", text: $login, imageName: "mail")
                    .padding(.horizontal)
                CustomSecureField(placeholder: "Password", text: $password, validPass: $passIsValid)
                    .padding(.horizontal)
                
                
                HStack{
                    Button {
                        
                    } label: {
                        Text("Forgot password?")
                            .foregroundColor(AppColor.mainText.color)
                            .font(.p2)
                            .padding()
                    }

                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Spacer()
                
                ButtonConstructor(text: "Login", fullWidth: true, backgroundColor: .primary) {
                    //login
                    withAnimation {
                        startLogin.toggle()
                    }
                }
                .padding(.bottom)
                
                Button {
                    
                } label: {
                    HStack{
                        Text("Don’t have any account?")
                            .foregroundColor(AppColor.mainText.color)
                            .font(.p2)
                        Text("Sign Up")
                            .foregroundColor(AppColor.primary.color)
                            .font(.h3)
                    }
                    .frame(height: 44, alignment: .center)
                }
                .padding(.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            if startLogin {
                Color.black.opacity(0.1).ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            startLogin.toggle()
                        }
                    }
                
                ProgressView()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
