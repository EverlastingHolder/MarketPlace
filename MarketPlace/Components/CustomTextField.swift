import SwiftUI

struct CustomTextField: View {
    
    @Binding
    var text: String
    let placeholder: String
    @State
    private var isHide: Bool = false
    @State
    var isTextField: switchTextField = .original
    
    
    var body: some View {
        ZStack {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color("TextBackground"))
                    .customFont(fontSize: 11, fontWeight: .medium)
            }
            HStack {
                switch isTextField {
                case .original:
                    TextField("", text: $text)
                        .textCase(.lowercase)
                        .textInputAutocapitalization(.never)
                        .padding(.leading, 15)
                case .secure:
                    if isHide {
                        TextField("", text: $text)
                            .textCase(.lowercase)
                            .textInputAutocapitalization(.never)
                            .padding(.leading, 15)
                    } else {
                        SecureField("", text: $text)
                            .textCase(.lowercase)
                            .textInputAutocapitalization(.never)
                            .padding(.leading, 15)
                    }
                    ZStack {
                        if isHide {
                            Image(systemName: "eye")
                        } else {
                            Image("eyeOff")
                        }
                    }
                    .frame(width: 15, height: 15)
                    .padding(.trailing, 15)
                    .onTapGesture {
                        isHide.toggle()
                    }
                case .search:
                    TextField("", text: $text)
                        .textCase(.lowercase)
                        .textInputAutocapitalization(.never)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                    Image("Search")
                        .padding(.trailing, 15)
                }
            }
             
        }
        .frame(height: 30)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("TextFieldBackground"))
        )
    }
    
    enum switchTextField {
        case original, secure, search
    }
}
