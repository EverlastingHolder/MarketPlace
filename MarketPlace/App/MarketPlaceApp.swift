import SwiftUI

@main
struct MarketPlaceApp: App {
    @StateObject
    private var viewModel: Self.ViewModel = .init()
    
    private let transition = AnyTransition.asymmetric(insertion: .slide, removal: .scale).combined(with: .opacity)
    var body: some Scene {
        WindowGroup {
            ZStack {
                switch viewModel.state {
                case .signIn:
                    SignInView(viewModel: .init(appViewModel: viewModel))
                        .transition(transition)
                        .backgroundColor(edges: .all)
                case .home:
                    AppTabBarView(viewModel: .init(appViewModel: viewModel))
                        .transition(transition)
                        .backgroundColor()
                case .login:
                    LoginView(viewModel: .init(appViewModel: viewModel))
                        .transition(transition)
                        .backgroundColor(edges: .all)
                }
            }
            .animation(.default, value: viewModel.state)
            .alert(isPresented: $viewModel.isPresented) {
                Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alertMessage ?? ""))
            }
            .preferredColorScheme(.light)
        }
    }
}
