//
//  ContentView.swift
//  Chefio
//
//  Created by Александр Фарносов on 19.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            SignInView()
        }
        .background(Color.white.ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
