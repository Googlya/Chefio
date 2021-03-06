//
//  SwiftUISlider.swift
//  Chefio
//
//  Created by Александр Фарносов on 25.05.2022.
//

import Foundation
import SwiftUI

struct CustomSlider: UIViewRepresentable {
    
    final class Coordinator: NSObject {
        var value: Binding<Double>
        
        init(value: Binding<Double>) {
            self.value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
    
    var minimumValue: Double
    var maximumValue: Double
    var thumbColor: UIColor = .white
    var minTrackColor: UIColor?
    var maxTrackColor: UIColor?
    
    @Binding var value: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = thumbColor
        slider.minimumTrackTintColor = minTrackColor
        slider.maximumTrackTintColor = maxTrackColor
        slider.value = Float(value)
        slider.minimumValue = Float(minimumValue)
        slider.maximumValue = Float(maximumValue)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(self.value)
    }
    
    func makeCoordinator() -> CustomSlider.Coordinator {
        Coordinator(value: $value)
    }
}
