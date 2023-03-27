import Combine
import SwiftUI

extension MarketPlaceApp {
    final class ViewModel: ObservableObject {
        @AppStorage("StateAppNavigation")
        var state: StateView = .signIn
        @Published
        var isPresented: Bool = false
        @Published
        var alertTitle: String = "Error"
        @Published
        var alertMessage: String? = nil
    }
}

enum StateView: String {
    case signIn, login, home
}
