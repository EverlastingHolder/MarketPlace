import Foundation

extension LoginView {
    class ViewModel: ObservableObject {
        @Published
        var password: String = ""
        @Published
        var firstName: String = ""
    }
}
