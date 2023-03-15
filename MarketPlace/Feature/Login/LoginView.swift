import SwiftUI

struct LoginView: View {
    @StateObject
    private var viewModel: LoginView.ViewModel = .init()
    @Binding
    var state: StateView
    
    var body: some View {
        VStack {
            Text("Welcome back")
                .customFont(fontSize: 26, fontWeight: .semibold)
                .padding(.bottom, 70)
            
            VStack(spacing: 35) {
                CustomTextField(text: $viewModel.firstName, placeholder: "First name")
                CustomTextField(text: $viewModel.password, placeholder: "Password", isSecure: true)
                
                Button(action: {
                    state = .home
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
