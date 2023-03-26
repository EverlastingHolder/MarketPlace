import Foundation

extension MarketPlaceApp {
    final class ViewModel: ObservableObject {
        @Published
        var state: StateView = .home
        @Published
        var isPresented: Bool = false
        @Published
        var alertTitle: String = "Error"
        @Published
        var alertMessage: String? = nil
    }
}

enum StateView {
    case signIn, login, home
}
