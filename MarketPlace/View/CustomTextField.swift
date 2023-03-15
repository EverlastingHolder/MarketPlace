import SwiftUI

struct CustomTextField: View {
    @Binding
    var text: String
    let placeholder: String
    var isSecure: Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                changeTextField
                    .padding(.leading, 15)
                    .padding(.trailing, isSecure ? 0 : 15)
                if isSecure {
                    Image("eyeOff")
                        .frame(width: 15, height: 15)
                        .padding(.trailing, 15)
                }
            }
                
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color("TextBackground"))
                    .customFont(fontSize: 11, fontWeight: .medium)
            }
        }
        .frame(height: 30)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("TextFieldBackground"))
        )
    }
    
    @ViewBuilder
    var changeTextField: some View {
        if isSecure {
            SecureField("", text: $text)
        } else {
            TextField("", text: $text)
        }
    }
}
