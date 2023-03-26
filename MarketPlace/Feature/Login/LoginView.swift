import SwiftUI

struct LoginView: View {
    @StateObject
    var viewModel: LoginView.ViewModel
    
    var body: some View {
        VStack {
            Text("Welcome back")
                .customFont(fontSize: 26, fontWeight: .semibold)
                .padding(.bottom, 70)
            
            VStack(spacing: 35) {
                // Поля ввода
                CustomTextField(text: $viewModel.email, placeholder: "Email")
                CustomTextField(text: $viewModel.password, placeholder: "Password", isTextField: .secure)
                
                //Кнопка входа
                Button(action: {
                    viewModel.checkPassword()
                }) {
                    HStack {
                        Spacer()
                        Text("Login")
                            .foregroundColor(.white)
                            .customFont(fontSize: 14, fontWeight: .bold)
                        Spacer()
                    }
                }
                .frame(height: 46)
                .background(Color("ButtonBackground"))
                .cornerRadius(15)
                
            }
            .padding(.horizontal, 44)
        }
    }
}
