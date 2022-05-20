//
//  CustomTextField.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct CustomTextField: View {
    @State var placeholder: String
    @Binding var text: String
    @State var imageName: String
    
    var body: some View {
        UIKitTextField(placeholder, text: $text)
            .modifier(textFieldModifier(imageName: imageName))
            .disableAutocorrection(true)
    }
}


fileprivate struct textFieldModifier: ViewModifier {
    @State var imageName: String
    
    func body(content: Content) -> some View {
        HStack{
            Image(systemName: imageName)
                .foregroundColor(Color("mainText"))
            content
                .padding(.vertical, 8)
                .foregroundColor(Color("mainText"))
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 32.0)
                .stroke(lineWidth: 1.0)
                .foregroundColor(Color("secondaryText"))
        )
    }
    
}

fileprivate struct UIKitTextField: UIViewRepresentable {
    var titleKey: String
    @Binding var text: String
    
    public init(_ titleKey: String, text: Binding<String>) {
        self.titleKey = titleKey
        self._text = text
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textField.placeholder = NSLocalizedString(titleKey, comment: "")
        textField.attributedPlaceholder = NSAttributedString(
            string: titleKey,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "secondaryText") ?? UIColor.gray]
        )

        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if text != uiView.text {
            uiView.text = text
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UITextFieldDelegate {
        var parent: UIKitTextField
        
        init(_ textField: UIKitTextField) {
            self.parent = textField
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            guard textField.markedTextRange == nil, parent.text != textField.text else {
                return
            }
            parent.text = textField.text ?? ""
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
}
