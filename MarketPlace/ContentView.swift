import SwiftUI

struct ContentView: View {
    @State
    var email: String = ""
    @State
    var lastName: String = ""
    @State
    var firstName: String = ""
    
    
    
    var body: some View {
        VStack(spacing: 70) {
            Text("Sign in")
                .customFont(fontSize: 26, fontWeight: .semibold)
            
            //Middle block
            VStack {
                VStack(spacing: 35) {
                    CustomTextField(text: $firstName, placeholder: "First name")
                    CustomTextField(text: $lastName, placeholder: "Last name")
                    CustomTextField(text: $email, placeholder: "Email")
                    
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Button(action: {}) {
                            HStack {
                                Spacer()
                                Text("Sign in")
                                    .foregroundColor(.white)
                                    .customFont(fontSize: 14, fontWeight: .bold)
                                Spacer()
                            }
                        }
                        .frame(height: 46)
                        .background(Color.blue)
                        .cornerRadius(15)
                        
                        Button(action: {}) {
                            HStack {
                                Text("Already have an account?")
                                    .foregroundColor(.gray)
                                    .customFont(fontSize: 10, fontWeight: .medium)
                                Text("Log in")
                                    .customFont(fontSize: 10, fontWeight: .medium)
                            }
                        }
                    }
                }
            }
            
            
            
            VStack(spacing: 38) {
                SignInWith(imageName: "google", text: "Google")
                SignInWith(imageName: "apple", text: "Apple")
            }
        }
        .padding(.horizontal, 44)
    }
}

struct SignInWith: View {
    let imageName: String
    let text: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(imageName)
                .frame(maxWidth: 24, maxHeight: 24)
            Text("Sign in with " + text)
                .customFont(fontSize: 12, fontWeight: .medium)
        }
    }
}


struct CustomTextField: View {
    @Binding
    var text: String
    let placeholder: String
    let isSecure: Bool = false
    var body: some View {
        ZStack {
            changeTextField
                .frame(height: 30)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("TextFieldBackground"))
                )
                
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color("TextBackground"))
                    .customFont(fontSize: 11, fontWeight: .medium)
            }
        }
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

