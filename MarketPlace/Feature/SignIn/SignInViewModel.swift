import Foundation
import Combine
import SwiftUI

extension SignInView {
    class ViewModel: ObservableObject {
        @Published
        var email: String = ""
        @Published
        var lastName: String = ""
        @Published
        var firstName: String = ""
        @Published
        var password: String = ""
        
        private var userModel = [UsersModel]()
        private var bag: Set<AnyCancellable> = .init()
        private let storage = SecureStorage()
        private let container = LoginDataController.shared.container
        weak var appViewModel: MarketPlaceApp.ViewModel?
        
        init(appViewModel: MarketPlaceApp.ViewModel) {
            self.appViewModel = appViewModel
            loadCachedData()
        }
        
        private func validationField() -> Bool {
            if isValidEmail(email) && !lastName.isEmpty && !firstName.isEmpty && !password.isEmpty { return true }
            return false
        }
        
        func toLogin() {
            appViewModel?.state = .login
        }
        
        func validationEmail() {
            if let _ = userModel.first(where: { $0.email == email }) {
                errorMessage(error: "User with email already ")
                return
            }
            if !validationField() {
                errorMessage(error: "Email failed")
                return
            }
            saveDataToCache()
            appViewModel?.state = .home
        }
        
        private func errorMessage(error: String) {
            appViewModel?.alertMessage = error
            appViewModel?.isPresented = true
        }
        
        private func saveDataToCache() {
            do {
                let users = Users(context: container.viewContext)
                users.firstName = firstName
                users.lastName = lastName
                users.email = email
                savePassword()
                
                if container.viewContext.hasChanges {
                    try container.viewContext.save()
                }
            } catch let error {
                print("Error occur:" + String(describing: error))
            }
        }
        
        private func loadCachedData() {
            CDPublisher(request: Users.fetchRequest(), context: container.viewContext)
                .subscribe(on: Scheduler.background)
                .receive(on: Scheduler.main)
                .map { users in
                    users.map { user in
                        UsersModel(
                            lastName: user.lastName,
                            firstName: user.firstName,
                            email: user.email
                        )
                    }
                }
                .sink(receiveCompletion: { _ in }) { [weak self] users in
                    self?.userModel = users
                }
                .store(in: &bag)
        }
        
        private func savePassword() {
            storage.addPassword(password, for: email)
        }
        
        private func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
        
        deinit {
            self.bag.forEach { $0.cancel() }
            self.bag.removeAll()
            appViewModel = nil
            print("deinit sign in")
        }
    }
}
