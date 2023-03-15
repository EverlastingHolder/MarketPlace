import SwiftUI

@main
struct MarketPlaceApp: App {
    @StateObject
    private var viewModel: MarketPlaceApp.ViewModel = .init()
    var body: some Scene {
        WindowGroup {
            let transition = AnyTransition.asymmetric(insertion: .slide, removal: .scale).combined(with: .opacity)
            ZStack {
                switch viewModel.state {
                case .signIn:
                    SignInView(state: $viewModel.state)
                        .id(1)
                        .transition(transition)
                case .home:
                    EmptyView()
                        .id(2)
                        .transition(transition)
                case .login:
                    LoginView(state: $viewModel.state)
                        .id(3)
                        .transition(transition)
                }
            }.animation(.default, value: viewModel.state)
        }
    }
}
