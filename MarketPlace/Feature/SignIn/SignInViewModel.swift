import Foundation

extension SignInView {
    class ViewModel: ObservableObject {
        @Published
        var email: String = ""
        @Published
        var lastName: String = ""
        @Published
        var firstName: String = ""
    }
}
