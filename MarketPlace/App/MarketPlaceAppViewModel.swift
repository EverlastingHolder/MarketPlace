import Foundation

extension MarketPlaceApp {
    class ViewModel: ObservableObject {
        @Published
        var state: StateView = .signIn
    }
}

enum StateView {
    case signIn, login, home
}
