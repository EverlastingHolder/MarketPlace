import SwiftUI

struct CustomTextField: View {
    
    @Binding
    var text: String
    @State
    private var isHide: Bool = false
    let placeholder: String
    @State
    var isSecure: Bool = false
    
    var body: some View {
        ZStack {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color("TextBackground"))
                    .customFont(fontSize: 11, fontWeight: .medium)
            }
            HStack {
                changeTextField
                    .padding(.leading, 15)
                    .padding(.trailing, isSecure ? 0 : 15)
                if isSecure {
                    ZStack {
                        if isHide {
                            Image("eyeOff")
                        } else {
                            Image(systemName: "eye")
                        }
                    }
                    .frame(width: 15, height: 15)
                    .padding(.trailing, 15)
                    .onTapGesture {
                        isHide.toggle()
                        isSecure.toggle()
                    }
                }
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
