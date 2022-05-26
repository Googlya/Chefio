//
//  VerificationField.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct VerificationField: View {
    @Binding var pins: String
    
    @State var countCells: Int
    var function: () -> Void
    
    var body: some View {
        ZStack{
            pinCell
            backgroundField
        }
    }
    
    private var pinCell: some View {
        HStack{
            ForEach(0..<4) { index in
                if pins.count < index || pins[index] == "" {
                    Text("_")
                        .foregroundColor(AppColor.secondaryText.color)
                        .font(.system(size: 34, weight: .medium, design: .default))
                        .padding()
                        .padding(.horizontal)
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1.0)
                                .foregroundColor(AppColor.secondaryText.color)
                        )
                } else {
                    Text("\(String(pins[index]))")
                        .foregroundColor(AppColor.mainText.color)
                        .font(.system(size: 34, weight: .bold, design: .default))
                        .padding()
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1.0)
                                .foregroundColor(AppColor.primary.color)
                        )
                }
            }
        }
        .onChange(of: pins) { newValue in
            if newValue.count >= 4 {
                function()
            }
        }
    }
    
    private var backgroundField: some View {
        return TextField("", text: $pins, onCommit: function)
            .keyboardType(.numberPad)
            .foregroundColor(.clear)
            .accentColor(.clear)
    }
    
}

struct CircularEndBox: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cornerSize: CGSize
        if rect.width > rect.height {
            cornerSize = CGSize(width: rect.height/2, height: rect.height/2)
        } else {
            cornerSize = CGSize(width: rect.width/2, height: rect.width/2)
        }
        path.addRoundedRect(in: rect, cornerSize: cornerSize)
        return path
    }
}
