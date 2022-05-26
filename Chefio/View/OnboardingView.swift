//
//  OnboardingView.swift
//  Chefio
//
//  Created by Александр Фарносов on 19.05.2022.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack{
            //IMAGE
            
            Spacer()
            
            Text("Start Cooking")
                .font(.h1)
                .foregroundColor(AppColor.mainText.color)
            
            Text("Let’s join our community to cook better food!")
                .font(.p1)
                .foregroundColor(AppColor.secondaryText.color)
                .padding()
                .padding(.horizontal, 32)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            ButtonConstructor(text: "Get Started", fullWidth: true, backgroundColor: .primary) {
                //Route
            }
            .padding(.bottom)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
