//
//  CustomSecureField.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import SwiftUI

struct CustomSecureField: View {
    @State var placeholder: String
    @Binding var text: String
    
    @State var showPass: Bool = true
    @Binding var validPass: Bool
    
    var body: some View {
        UIKitSecureField(placeholder, text: $text, presenter: $showPass)
            .modifier(secureFieldModifier(presenter: $showPass, valid: $validPass))
            .disableAutocorrection(true)
    }
}

fileprivate struct secureFieldModifier: ViewModifier {
    @Binding var presenter: Bool
    @Binding var valid: Bool
    
    func body(content: Content) -> some View {
        HStack{
            Image(systemName: "lock")
                .foregroundColor(Color("mainText"))
            
            content
                .padding(.vertical, 8)
            
            Button {
                presenter.toggle()
            } label: {
                Image(systemName: presenter ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(Color("secondaryText"))
            }

        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 32.0)
                .stroke(lineWidth: 1.0)
                .foregroundColor(valid ? Color("primary") : Color("secondaryText"))
        )
    }
}

fileprivate struct UIKitSecureField: UIViewRepresentable {
    var titleKey: String
    @Binding var text: String
    @Binding var presenter: Bool
    
    public init(_ titleKey: String, text: Binding<String>, presenter: Binding<Bool>) {
        self.titleKey = titleKey
        self._text = text
        self._presenter = presenter
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.isSecureTextEntry = presenter
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
        
        uiView.isSecureTextEntry = presenter
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UITextFieldDelegate {
        var parent: UIKitSecureField
        
        init(_ textField: UIKitSecureField) {
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
