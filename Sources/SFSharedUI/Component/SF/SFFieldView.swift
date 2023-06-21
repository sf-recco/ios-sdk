import SwiftUI
import UIKit

public struct SFFieldView: View {
    public init(
        text: Binding<String>,
        keyboardType: UIKeyboardType = .decimalPad,
        placeholder: String,
        label: String? = nil
    ) {
        self._text = text
        self.keyboardType = keyboardType
        self.placeholder = placeholder
        self.label = label
    }
    
    @State private var focused: Bool = false

    @Binding var text: String
    var keyboardType: UIKeyboardType
    var placeholder: String
    var label: String?
    
    public var body: some View {
        HStack(spacing: .S) {
            UIKitTextField(
                isFocused: $focused,
                text: $text,
                keyboardType: keyboardType
            )
            .frame(height: 48)
            .placeholder(when: text.isEmpty) {
                Text(placeholder)
                    .foregroundColor(.sfPrimary40)
                    .body2()
            }
            .padding(.leading, .S)
            
            if let label {
                Spacer()
                Text(label)
                    .foregroundColor(.sfPrimary40)
                    .body2()
                    .padding(.trailing, .S)
            }
        }
        .accentColor(.sfAccent)
        .overlay(
            Rectangle()
                .fill(focused ? Color.sfAccent : Color.sfPrimary20)
                .frame(height: 2),
            alignment: .bottom
        )
        .background(
            Rectangle()
                .fill(focused ? Color.sfAccent20 : Color.sfBackground)
                .cornerRadius(.XXS, corners: [.topLeft, .topRight])
        )
    }
}

fileprivate class ModifiedTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}

fileprivate struct UIKitTextField: UIViewRepresentable {
    @Binding var isFocused: Bool
    @Binding var text: String
    var keyboardType: UIKeyboardType
    
    func makeUIView(context: Context) -> ModifiedTextField {
        let textField = ModifiedTextField(frame: .zero)
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.textColor = .sfPrimary
        textField.delegate = context.coordinator
        textField.keyboardType = .decimalPad
        textField.tintColor = .sfAccent
        textField.keyboardType = keyboardType
        textField.backgroundColor = .clear
        return textField
    }
    
    
    func updateUIView(_ uiView: ModifiedTextField, context: Context) {
        uiView.text = text
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    class Coordinator: NSObject, UITextFieldDelegate {
        let parent: UIKitTextField
        
        init(_ parent: UIKitTextField) {
            self.parent = parent
        }
        
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.isFocused = true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.isFocused = false
        }
    }
}

extension View {
    func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {

            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
