import SwiftUI

struct SignInView: View {
    @StateObject
    var viewModel: SignInView.ViewModel
    
    var body: some View {
        VStack(spacing: 70) {
            Text("Sign in")
                .customFont(fontSize: 26, fontWeight: .semibold)
            //Middle block
            VStack {
                VStack(spacing: 35) {
                    // Поля ввода
                    CustomTextField(text: $viewModel.firstName, placeholder: "First name")
                    CustomTextField(text: $viewModel.lastName, placeholder: "Last name")
                    CustomTextField(text: $viewModel.email, placeholder: "Email")
                    CustomTextField(text: $viewModel.password, placeholder: "Password", isTextField: .secure)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Button(action: {
                            viewModel.validationEmail()
                        }) {
                            HStack {
                                Spacer()
                                Text("Sign in")
                                    .foregroundColor(.white)
                                    .customFont(fontSize: 14, fontWeight: .bold)
                                Spacer()
                            }
                        }
                        .frame(height: 46)
                        .background(Color("ButtonBackground"))
                        .cornerRadius(15)
                        // Переход на LoginView
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.gray)
                                .customFont(fontSize: 10, fontWeight: .medium)
                            Button(action: {
//                                withAnimation() {
                                    viewModel.toLogin()
//                                }
                            }) {
                                Text("Log in")
                                    .customFont(fontSize: 10, fontWeight: .medium)
                            }
                        }
                    }
                }
            }
            // Кнопки входа через google & apple
            VStack(spacing: 38) {
                SignInWith(imageName: "google", text: "Google")
                SignInWith(imageName: "apple", text: "Apple")
            }
        }
        .padding(.horizontal, 44)
    }
    
    private struct SignInWith: View {
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
}


